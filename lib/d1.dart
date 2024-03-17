import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 19, 18),
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
            icon: Icon(Icons.calendar_today, color: Colors.white),
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
            icon: Icon(Icons.help, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: isHelpPressed
            ? SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Color.fromARGB(255, 33, 22, 2),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : Text(
                "soufyane felate",
                style: TextStyle(
                  color: Color.fromARGB(255, 248, 244, 236),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 19, 18),
        title: const Text(
          'Calendar',
          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Change icon color
      ),
      body: const Center(
        child: Text(
          'Calendar Placeholder',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 19, 18),
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Change icon color
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'How To Use',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 33, 22, 2),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '''1- Before starting, you have to setup Clients, Projects, and Company in the settings
2- Then you can add time record
3- You can analyze time records by bar/line chart
4- You may export time records in HTML, EXCEL, and CSV file format
5- You may invoice time record in PDF and send to client for the payment''',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Timesheet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('''1- Click Title to change period
2- Click Plus icon to add new time record
3- Click 'Add Multiple Records' icon to add multiple records at once
4- Click Export/Email icon to export/email in HTML, EXCEL or CSV format
5- Click Calendar icon to view in calendar mode
6- Click Filter icon to filter data by Tag, Status, Client and Project
7- Click Sort icon to sort data by Date(default), Amount, Project and Client
8- Click Time record to update, delete and copy
9- Long click Time record for multiple selection
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Add Hour/Flat Rate Time Record',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''1- In project setting, you can choose Hour/Flat Rate
2- When you add a new time record, choose the Hour/Flat Rate project
3- The new time record will be Hour/Flat Rate based on the project setting''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'How To Setup Premium Hours',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''
1- In project setting, you can choose the premium hour
2- In premium hour setting, setup start/end time and date
3- Premium hour will be calculated based on the project
''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
