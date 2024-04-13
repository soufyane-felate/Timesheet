import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'calendar_page.dart';
import 'help.dart';
import 'update_time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Second(),
    );
  }
}

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  bool _isRunning = false;
  int _selectedIndex = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 30), _updateTime);
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification(String title, String body) async {
    String elapsedTime = TimerUtil.formatTime(_stopwatch.elapsedMilliseconds);
    body = '$body\nElapsed Time: $elapsedTime';

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'Timesheet App',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      enableVibration: false,
      playSound: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void _updateTime(Timer timer) {
    if (_isRunning) {
      _showNotification('Stopwatch Running', 'Elapsed Time:');
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Want to stop?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _stopwatch.stop();
                _stopwatch.reset();
                _isRunning = false;
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateTime()),
                );
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDropdown(String label) {
    List<String> items = [];
    String? selectedValue;

    if (label == 'Project') {
      items = [
        'Hourly Rate',
        'Flat Rate',
        'Overtime',
        'Night Shift',
        'Holiday',
        'Unpaid Leave',
      ];
    } else if (label == 'Client') {
      items = ['Default Client'];
    }

    return DropdownButton<String>(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(label),
      onChanged: (String? value) {},
    );
  }

  Widget _buildCounter(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18)),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildButton(String text, IconData icon, {VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = TimerUtil.formatTime(_stopwatch.elapsedMilliseconds);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 19, 18),
        title: const Text(
          'Timesheet',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
            icon: const Icon(Icons.calendar_today, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },
            icon: const Icon(Icons.help, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                formattedTime,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 195,
                    color: Colors.green,
                    child: IconButton(
                      icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                      onPressed: _toggleTimer,
                      iconSize: 48,
                    ),
                  ),
                  Container(
                    width: 195,
                    color: Colors.red,
                    child: IconButton(
                      icon: Icon(Icons.stop),
                      onPressed: _resetTimer,
                      iconSize: 48,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDropdown('Project'),
                  _buildDropdown('Client'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCounter('Day', '00:00h'),
                  _buildCounter('Month', '00:00h'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              tabs: [
                GButton(
                  icon: Icons.access_time,
                  text: 'Time',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.bar_chart,
                  text: 'Statistics',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.receipt,
                  text: 'Invoice',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.data_usage,
                  text: 'Data',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.exit_to_app,
                  text: 'Exit',
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 3, 35, 61),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 230, 238),
                  onPressed: () => exit(0),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TimerUtil {
  static String formatTime(int milliseconds) {
    int seconds = (milliseconds ~/ 1000) % 60;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
