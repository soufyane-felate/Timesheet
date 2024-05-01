import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timesheet_1/models/showModel.dart';
import 'package:timesheet_1/update_time.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late List<ShowModel> timeRecords = [];
  String dropdownValue = 'year';
  late DateTime startDate = DateTime.now();
  late DateTime endDate = DateTime.now();
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<Color> colorList = [
    Color.fromARGB(255, 139, 230, 236),
    const Color.fromARGB(255, 95, 155, 97),
    const Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 236, 226, 133)
  ];

  @override
  void initState() {
    super.initState();
    fetchTimeRecords();
  }

  Future<void> fetchTimeRecords() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.10:8000/api/time_show'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];

      setState(() {
        timeRecords = data.map((record) => ShowModel.fromJson(record)).toList();
      });
    } else {
      print('Failed to load time records: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
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
                    startDate =
                        DateTime(DateTime.now().year, DateTime.now().month, 1);
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
      body: Column(
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
                Text(" ${DateTime.now().day}-${DateTime.now().month}"),
                Text(" ${daysOfWeek[DateTime.now().weekday - 1]}"),
              ],
            ),
          ),
          if (timeRecords.isEmpty)
            Center(
              child: CircularProgressIndicator(),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: timeRecords.length,
                itemBuilder: (context, index) {
                  final record = timeRecords[index];
                  final color = colorList[index % colorList.length];

                  return Container(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 40,
                                    color: color,
                                  ),
                                ],
                              ),
                              Text(
                                '${record.timeIn}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '${record.timeOut}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '${record.selectedProject} - ${record.client}',
                              ),
                              Text(
                                '${record.timebreak} - ${record.workingHours}',
                              ),
                              Text('${record.description}'),
                              Text('${record.notes} - ${record.tags}'),
                            ],
                          ),
                          Divider(
                            height: 2,
                            color: Colors.black,
                          )
                        ],
                      ),
                      // onTap: ...
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
