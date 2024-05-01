import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:timesheet_1/models/showModel.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String dropdownValue = 'year';
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

  List<String> selectedProjects = [];

  Future<ShowModel> fetchProjects() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.10:8000/api/time_show'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ShowModel.fromJson(data['data']);
      } else {
        throw Exception(
            'Failed to load projects. Server responded with status code ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load projects: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProjects().then((value) {
      setState(() {
        selectedProjects = value.selectedProject as List<String>;
        selectedProjects = value.client as List<String>;
      });
    }).catchError((error) {
      print('Error fetching projects: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: dropdownValue,
                items: const [
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
                    } else if (value == 'quarter-week' ||
                        value == 'bi-week' ||
                        value == 'week') {
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
                    title: Text(selectedProjects[index]),
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
