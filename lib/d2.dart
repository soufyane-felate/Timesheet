/*import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timesheet_1/update_time.dart';

import 'calendar_page.dart';
import 'help.dart';

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
  bool isHelpPressed = false;
  late Stopwatch _stopwatch;
  late Timer _timer;
  bool _isRunning = false;
  bool _isPushInVisible = true; // Added state for Push In button visibility

  String? _selectedProject;
  String? _selectedClient;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), _updateTime);
  }

  void _updateTime(Timer timer) {
    if (_stopwatch.isRunning) {
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
      _startTimer();
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    _stopwatch.reset();
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  void _pushInTimer() {
    _startTimer();
    setState(() {
      _isPushInVisible = false;
    });
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
      selectedValue = _selectedProject;
    } else if (label == 'Client') {
      items = ['Default Client'];
      selectedValue = _selectedClient;
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
      onChanged: (String? value) {
        setState(() {
          if (label == 'Project') {
            _selectedProject = value;
          } else if (label == 'Client') {
            _selectedClient = value;
          }
        });
      },
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
              setState(() {
                isHelpPressed = true;
              });
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
              if (_isPushInVisible)
                Container(
                  width: 195,
                  color: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.push_pin),
                    onPressed: _pushInTimer, // Starts timer and hides "Push In"
                    iconSize: 48,
                  ),
                ),
              if (!_isPushInVisible)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 195,
                        color: Colors.green,
                        child: IconButton(
                          icon:
                              Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                          onPressed: _toggleTimer,
                          iconSize: 48,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 195,
                        color: Colors.red,
                        child: IconButton(
                          icon: Icon(Icons.stop),
                          onPressed: _resetTimer,
                          iconSize: 48,
                        ),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton('Time', Icons.access_time, onPressed: () {}),
            _buildButton('Statistics', Icons.bar_chart, onPressed: () {}),
            _buildButton('Invoice', Icons.receipt, onPressed: () {}),
            _buildButton('Settings', Icons.settings, onPressed: () {}),
            _buildButton('Data', Icons.data_usage, onPressed: () {}),
            _buildButton('Exit', Icons.exit_to_app, onPressed: () => exit(0)),
          ],
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
*/