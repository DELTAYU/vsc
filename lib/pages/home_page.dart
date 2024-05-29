import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supabase/supabase.dart' as supabase;
import 'package:table_calendar/table_calendar.dart';
import 'package:vsc/componenets/NotificationDetailScreen.dart';
import 'package:vsc/componenets/constants.dart';
import 'package:vsc/componenets/my_drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _firstDay = DateTime.now();
  DateTime _lastDay = DateTime.now().add(Duration(days: 13)); // Show 14 days

  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    super.initState();
    _checkAttendanceStatus();
  }

  Future<void> _checkAttendanceStatus() async {
    final supabaseClient = supabase.SupabaseClient(
        'https://mhfnttlxzmusbqdnyuum.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1oZm50dGx4em11c2JxZG55dXVtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwNzMzMjM2MywiZXhwIjoyMDIyOTA4MzYzfQ.KUkkkp6nutcdt_t2LFvcYbHeE9xsW5wywzxT6qd51kM');
    final data = await supabaseClient
        .from('attendance')
        .select('camera_log_picture,known,time')
        .eq('known', false);

    if (data != null && data.isNotEmpty) {
      setState(() {
        _notifications = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  void _dismissNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      drawer: MyDrawer(),
      drawerScrimColor: primaryColor,
      body: _selectedIndex == 0 ? buildCalendar() : buildNotificationCenter(),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget buildCalendar() {
    return Column(
      children: [
        Container(
          color: primaryColor,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "ARTEX",
                  style: GoogleFonts.ubuntu(
                    color: Colors.white54,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "APP",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to ARTEX APP!',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '   ArtexApp is a user-friendly app designed to    ',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'streamline attendance tracking for employees',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'and managers. It offers features like clock-in/clock-out,',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'geolocation tracking, shift scheduling, and attendance',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'reports for accurate and efficient management.',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Calendar ',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 29,
                        ),
                      ),
                    ],
                  ),
                  TableCalendar(
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarFormat: CalendarFormat.twoWeeks, // Show 14 days
                    daysOfWeekVisible:
                        true, // Set to true if you want to show days of the week
                    calendarStyle: CalendarStyle(
                      // Adjust these values to make the calendar cells smaller
                      outsideDaysVisible: false,
                      weekendTextStyle: TextStyle(color: Colors.grey),
                      holidayTextStyle: TextStyle(color: Colors.grey),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      todayTextStyle: TextStyle(color: Colors.white),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // Hide format button
                      titleCentered: true,
                      formatButtonShowsNext: false,
                      titleTextStyle: TextStyle(fontSize: 18),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.black),
                      weekendStyle: TextStyle(color: Colors.black),
                    ),
                    calendarBuilders: CalendarBuilders(
                      // Customize day builder to show only two lines
                      defaultBuilder: (context, date, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${date.day}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              DateFormat('E').format(date),
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNotificationCenter() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Notifications',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return Dismissible(
                key: Key(notification['camera_log_picture']),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                onDismissed: (direction) {
                  _dismissNotification(index);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      notification['camera_log_picture'],
                    ),
                  ),
                  title: Text(
                    'Security Notification',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'An unknown face at the door',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    final String timeString = _notifications[index]['time'];
                    final DateTime dateTime = DateTime.parse(timeString);
                    final notification = NotificationModel(
                      name: _notifications[index]['name'],
                      time: DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime),
                      imageUrl: _notifications[index]['camera_log_picture'],
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NotificationDetailScreen(notification),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
