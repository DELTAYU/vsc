import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vsc/componenets/constants.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final _future = Supabase.instance.client.from('attendance').select(
      'id, time, known,camera_log_picture, user: users(name,id, image_url)');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEnd2,
      appBar: AppBar(
        title: const Text('CameraHistory'),
        backgroundColor: gradientEnd2,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final attendance = snapshot.data! as List<dynamic>;
          return SingleChildScrollView(
            child: Container(
              height: 800,
              width: 400,
              margin: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 10, right: 10),
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
                columnSpacing: 56,
                columns: const [
                  DataColumn(
                    label: SizedBox(
                      width: 70,
                      child: Text('CameraLogs', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 60,
                      child: Text('UserName', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 60,
                      child: Text('Time', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ],
                rows: attendance.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Image.network(item['camera_log_picture'] ?? '')),
                      DataCell(Text(item['user'] != null
                          ? item['user']['name']
                          : 'unknown')),

                      DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(DateTime.parse(item['time'])))),

                      // DataCell(
                      //   FutureBuilder<String>(
                      //     future: Supabase.instance.client.storage
                      //         .from('images')
                      //         .createSignedUrl(item["user_id"] ?? '', 60),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.connectionState ==
                      //           ConnectionState.waiting) {
                      //         return CircularProgressIndicator();
                      //       } else if (snapshot.hasError) {
                      //         return Text(
                      //             'Error loading image: ${snapshot.error}');
                      //       } else {
                      //         return Image.network(snapshot.data!);
                      //       }
                      //     },
                      //   ),
                      // ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
