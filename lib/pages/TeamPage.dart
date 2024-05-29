import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vsc/componenets/constants.dart';
import 'package:vsc/pages/WorkerStatisticsPage.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final future = Supabase.instance.client
      .from('users')
      .select('id, name, role, image_url');
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  PlatformFile? _selectedImages;

  Future<void> _deleteMember(String name, String role) async {
    try {
      final name = _nameController.text.trim();
      final role = _roleController.text.trim();
      await Supabase.instance.client
          .from('users')
          .delete()
          .match({'name': name, 'role': role});
      _nameController.clear();
      _roleController.clear();
      // Refresh the data table
      setState(() {
        future;
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _fetchUsers() async {
    await Supabase.instance.client.from('users').select();
  }

  Future<void> _addNewMember() async {
    try {
      // Get the new member data from the text fields
      final name = _nameController.text.trim();
      final role = _roleController.text.trim();

      // 1 - insert new user { name: name, role: role } and get user_id
      final response = await Supabase.instance.client
          .from('users')
          .insert({'name': name, 'role': role})
          .select('id')
          .single();

      final userId = response['id'];

      // 2 - upload image with userId as the file name
      final imageUrl = await _uploadImage(_selectedImages!, userId);
      await Supabase.instance.client
          .from('train_model')
          .insert({'user_id': userId});
      print(imageUrl);
      // 3 - update the user with the imageUrl
      await Supabase.instance.client
          .from('users')
          .update({'image_url': imageUrl}).eq('id', userId);

      // Clear the text fields and the selected images
      _nameController.clear();
      _roleController.clear();
      setState(() {
        _selectedImages;
      });

      // Refresh the data table
      await _fetchUsers();
    } catch (error) {
      // Handle any errors that occur during the insert operation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding new member: $error'),
        ),
      );
    }
  }

  Future<String> _uploadImage(PlatformFile file, String userId) async {
    try {
      // Construct the file name with the userId as a directory
      final fileName = '$userId/${file.name}';

      // Upload the file to the 'registred_users_faces' bucket
      await Supabase.instance.client.storage
          .from('registred_users_faces')
          .upload(fileName, File(file.path!));

      // Create a signed URL for the uploaded file
      final signedUrl = await Supabase.instance.client.storage
          .from('registred_users_faces')
          .createSignedUrl(fileName, 58000000000000000);

      return signedUrl; // Adjust the expiry time as needed
    } catch (e) {
      // Handle any errors that occurred during the upload
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading image: $e'),
        ),
      );
      return '';
    }
  }

  Future<void> _selectImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _selectedImages = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEnd2,
      appBar: AppBar(
        title: const Text('Team'),
        backgroundColor: gradientEnd2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: Colors.black,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _roleController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: 'Enter Role',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Iconsax.status,
                      color: Colors.black,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                  width: 10,
                ),
                Container(
                  width: 130, // Set the desired width
                  height: 50,
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintText: _selectedImages?.name ?? 'Image',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Iconsax.image,
                        color: Colors.black,
                        size: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.black,
                        ),
                        onPressed: _selectImages,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: _addNewMember,
                  child: const Text(
                    'Add New Member',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 42), // Adjust the width for 2 cm spacing
                ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String role = _roleController.text;
                    _deleteMember(name, role);
                  },
                  child: const Text('Delete Member',
                      style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching data'));
                  } else if (snapshot.data == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final users = snapshot.data as List<dynamic>;
                    return SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, bottom: 32),
                        height: 700,
                        width: 550,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(
                                label: Text(
                              'Name',
                              style: TextStyle(color: Colors.black),
                            )),
                            DataColumn(
                                label: Text(
                              'Role',
                              style: TextStyle(color: Colors.black),
                            )),
                          ],
                          rows: users.map((item) {
                            return DataRow(
                              onSelectChanged: (bool? selected) {
                                if (selected ?? false) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkStat(
                                        id: item['id'],
                                        name: item['name'],
                                        role: item['role'],
                                        imageUrl: item['image_url'] ??
                                            'https://ui-avatars.com/api/?name=' +
                                                item["name"],
                                        workerName: '',
                                      ),
                                    ),
                                  );
                                }
                              },
                              selected: false,
                              cells: [
                                DataCell(
                                  Text(
                                    item['name'].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                DataCell(Text(
                                  item['role'].toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
