import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  final String? selectedProject;
  final void Function(String)?
      onProjectAdded; // Function to handle project addition

  Time({required this.selectedProject, this.onProjectAdded});

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String dropdownValue = 'year'; // Initialize dropdown value to 'year'
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<String> selectedProjects = []; // List to store selected projects

  @override
  void initState() {
    super.initState();
    if (widget.selectedProject != null) {
      selectedProjects.add(widget.selectedProject!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text("Time", style: TextStyle(color: Colors.indigo)),
              DropdownButton<String>(
                value: dropdownValue,
                items: [
                  DropdownMenuItem(child: Text('Year'), value: 'year'),
                  DropdownMenuItem(child: Text('Month'), value: 'month'),
                  DropdownMenuItem(
                      child: Text('Semi-Month'), value: 'semi-month'),
                  DropdownMenuItem(
                      child: Text('Quarter-Week'), value: 'quarter-week'),
                  DropdownMenuItem(child: Text('Bi-Week'), value: 'bi-week'),
                  DropdownMenuItem(child: Text('Week'), value: 'week'),
                  DropdownMenuItem(child: Text('Day'), value: 'day'),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    SizedBox(
                      height: 10,
                    );

                    if (value == 'year') {
                      startDate = DateTime(DateTime.now().year, 1, 1);
                      endDate = DateTime(DateTime.now().year, 12, 31);
                    } else if (value == 'month') {
                      startDate = DateTime(
                          DateTime.now().year, DateTime.now().month, 1);
                      endDate = DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0);
                    } else if (value == 'semi-month') {
                      if (DateTime.now().day <= 15) {
                        startDate = DateTime(
                            DateTime.now().year, DateTime.now().month, 1);
                        endDate = DateTime(
                            DateTime.now().year, DateTime.now().month, 15);
                      } else {
                        startDate = DateTime(
                            DateTime.now().year, DateTime.now().month, 16);
                        endDate = DateTime(
                            DateTime.now().year, DateTime.now().month + 1, 0);
                      }
                    } else if (value == 'quarter-week') {
                      int daysUntilNextMonday = 8 - DateTime.now().weekday;
                      startDate = DateTime.now()
                          .subtract(Duration(days: daysUntilNextMonday - 1));
                      endDate = startDate.add(Duration(days: 6));
                    } else if (value == 'bi-week') {
                      int daysUntilNextMonday = 8 - DateTime.now().weekday;
                      startDate = DateTime.now()
                          .subtract(Duration(days: daysUntilNextMonday - 1));
                      endDate = startDate.add(Duration(days: 13));
                    } else if (value == 'week') {
                      int daysUntilNextMonday = 8 - DateTime.now().weekday;
                      startDate = DateTime.now()
                          .subtract(Duration(days: daysUntilNextMonday - 1));
                      endDate = startDate.add(Duration(days: 6));
                    } else if (value == 'day') {
                      startDate = DateTime.now();
                      endDate = startDate;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(" ${startDate.month}-${startDate.day}"),
                    Text(" - ${endDate.day}-${endDate.month}-${endDate.year}"),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(" ${DateTime.now().add(Duration(days: 3)).weekday}"),
                    Text(
                        " ${daysOfWeek[DateTime.now().add(Duration(days: 3)).weekday - 1]}"),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: selectedProjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Selected Project: ${selectedProjects[index]}"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(Time(selectedProject: "Your selected project"));
}
