import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vsc/componenets/constants.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({Key? key}) : super(key: key);

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = Supabase.instance.client
        .from('attendance')
        .select('id,time,user : users(name)')
        .eq('known', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEnd2,
      appBar: AppBar(
        title: const Text('Workers Attendance'),
        backgroundColor: gradientEnd2,
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
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final attendance = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                height: 850,
                width: 550,
                margin: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 15, right: 15),
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
                  columnSpacing: 46,
                  columns: const [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text('UserName', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child:
                            Text('EntryTime', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text('ExitTime', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                  rows: _buildRows(attendance),
                ),
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
      final entryTime1 = DateTime.parse(attendance[i]['time'].toString());
      final exitTime1 = DateTime.parse(attendance[i + 1]['time'].toString());
      if (entryTime1.day == exitTime1.day) {
        rows.add(DataRow(cells: [
          DataCell(Text(attendance[i]['user'] != null
              ? attendance[i]['user']['name'].toString()
              : 'Unknown')),
          DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(entryTime1))),
          DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(exitTime1))),
        ]));
      } else {
        rows.add(DataRow(cells: [
          DataCell(Text(attendance[i]['user'] != null
              ? attendance[i]['user']['name'].toString()
              : 'Unknown')),
          DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(entryTime1))),
          DataCell(Text('')),
        ]));
        rows.add(DataRow(cells: [
          DataCell(Text(attendance[i + 1]['user'] != null
              ? attendance[i + 1]['user']['name'].toString()
              : 'Unknown')),
          DataCell(Text('')),
          DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(exitTime1))),
        ]));
      }
    }
    if (attendance.length % 2 != 0) {
      final lastEntryTime = DateTime.parse(attendance.last['time'].toString());
      rows.add(DataRow(cells: [
        DataCell(Text(attendance.last['user'] != null
            ? attendance.last['user']['name'].toString()
            : 'Unknown')),
        DataCell(Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(lastEntryTime))),
        DataCell(Text('')),
      ]));
    }
    return rows;
  }
}
