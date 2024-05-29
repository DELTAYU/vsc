import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Management extends StatefulWidget {
  const Management({Key? key}) : super(key: key);

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  late Future<List<Map<String, dynamic>>> _future;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _future = _fetchAttendanceData(_selectedDate);
  }

  Future<List<Map<String, dynamic>>> _fetchAttendanceData(DateTime date) async {
    try {
      final response = await Supabase.instance.client
          .from('attendance')
          .select('id,time,user:users(name)')
          .eq('known', true)
          .gte('time', DateFormat('yyyy-MM-dd').format(date))
          .lt('time',
              DateFormat('yyyy-MM-dd').format(date.add(Duration(days: 1))))
          .order('time', ascending: true);

      final data = (response as List).cast<Map<String, dynamic>>();

      final filteredData = data.where((element) {
        final time = DateTime.parse(element['time'].toString()).toLocal();
        return time.year == date.year &&
            time.month == date.month &&
            time.day == date.day;
      }).toList();

      return filteredData;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Workers Management'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return const Center(child: Text('No data available'));
          } else {
            final attendance = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null && picked != _selectedDate) {
                          setState(() {
                            _selectedDate = picked;
                            _future = _fetchAttendanceData(_selectedDate);
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Select Date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: 800,
                        width: 650,
                        margin: const EdgeInsets.all(10),
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
                          columnSpacing: 16,
                          columns: const [
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text('Names',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text('Delay',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text('Duration',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text('Lost Time',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                          ],
                          rows: _buildRows(attendance),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<DataRow> _buildRows(List<Map<String, dynamic>> attendance) {
    List<DataRow> rows = [];
    for (var i = 0; i < attendance.length - 1; i += 2) {
      final entryTime =
          DateTime.parse(attendance[i]['time'].toString()).toLocal();
      final exitTime =
          DateTime.parse(attendance[i + 1]['time'].toString()).toLocal();

      final delay = entryTime.isAfter(
              DateTime(entryTime.year, entryTime.month, entryTime.day, 8, 0))
          ? entryTime.difference(
              DateTime(entryTime.year, entryTime.month, entryTime.day, 8, 0))
          : Duration.zero;
      final duration = exitTime.difference(entryTime);
      final lostTime = duration < Duration(hours: 8)
          ? Duration(hours: 8) - duration
          : Duration.zero;

      if (entryTime.day == exitTime.day) {
        rows.add(DataRow(cells: [
          DataCell(Text(
              attendance[i]['user'] != null
                  ? attendance[i]['user']['name'].toString()
                  : 'Unknown',
              style: TextStyle(fontSize: 14))),
          DataCell(Text(
              '${delay.inHours}:${delay.inMinutes.remainder(60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14))),
          DataCell(Text(
              '${duration.inHours}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14))),
          DataCell(Text(
              '${lostTime.inHours}:${lostTime.inMinutes.remainder(60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14))),
        ]));
      }
    }
    if (attendance.length % 2 != 0) {
      final lastEntryTime =
          DateTime.parse(attendance.last['time'].toString()).toLocal();
      final delay = lastEntryTime.isAfter(DateTime(
              lastEntryTime.year, lastEntryTime.month, lastEntryTime.day, 8, 0))
          ? lastEntryTime.difference(DateTime(
              lastEntryTime.year, lastEntryTime.month, lastEntryTime.day, 8, 0))
          : Duration.zero;
      final lostTime = Duration(hours: 8) - delay;

      rows.add(DataRow(cells: [
        DataCell(Text(attendance.last['user'] != null
            ? attendance.last['user']['name'].toString()
            : 'Unknown')),
        DataCell(Text('${delay.inHours}:${delay.inMinutes.remainder(60)}')),
        DataCell(Text('')),
        DataCell(
            Text('${lostTime.inHours}:${lostTime.inMinutes.remainder(60)}')),
      ]));
    }
    return rows;
  }
}
