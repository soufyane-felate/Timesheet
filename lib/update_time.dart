import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timesheet_1/api/api.dart';
import 'package:timesheet_1/btnButtomFeatures/time/time.dart';

class UpdateTime extends StatefulWidget {
  final String? selectedProject;
  final String? selectedClientName;

  UpdateTime({this.selectedProject, this.selectedClientName});

  @override
  _UpdateTimeState createState() => _UpdateTimeState();
}

class _UpdateTimeState extends State<UpdateTime> {
  bool status1 = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();
  TimeOfDay selectedTimeWorking = TimeOfDay(hour: 00, minute: 00);

  String _getCurrentDate() {
    return DateFormat('dd/MM').format(selectedDate);
  }

  String _getCurrentDate2() {
    return DateFormat('dd/MM').format(selectedDate2);
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm').format(DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    ));
  }

  String _getCurrentTime2() {
    return DateFormat('HH:mm').format(DateTime(
      selectedDate2.year,
      selectedDate2.month,
      selectedDate2.day,
      selectedTime2.hour,
      selectedTime2.minute,
    ));
  }

  String _getWorkingHours() {
    int minutes = selectedTimeWorking.hour * 60 + selectedTimeWorking.minute;
    return '${(minutes ~/ 60).toString().padLeft(2, '0')}:${(minutes % 60).toString().padLeft(2, '0')}';
  }

  final TextEditingController _breakController = TextEditingController();
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  List<String> _statusOptions = ["open", "follow up", "Invoiced", "Paid"];
  String _selectedStatus = "open";
  String _selectedTags = "Company";
  List<String> _tagsOptions = [
    "Company",
    "follow up",
    "In process",
    "Personal"
  ];

  @override
  void dispose() {
    _breakController.dispose();
    _hourlyRateController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    _statusController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _saveApi() async {
    try {
      var data = {
        'selectedProject': widget.selectedProject,
        'client': widget.selectedClientName,
        'timeIn': _getCurrentDate() + ' ' + _getCurrentTime(),
        'timeOut': _getCurrentDate2() + ' ' + _getCurrentTime2(),
        'timebreak': _breakController.text,
        'workingHours': _getWorkingHours(),
        'hourlyRate': _hourlyRateController.text,
        'description': _descriptionController.text,
        'notes': _notesController.text,
        'status': _selectedStatus,
        'tags': _selectedTags,
        'billable': status1 ?? 'true'
      };

      var res = await CallApi().postData(data);

      var body = json.decode(res.body);
      if (res.statusCode == 200 && body['success']) {
        print('success');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Time()),
        );
      } else {
        throw 'Failed to save data: ${['message']}';
      }
    } catch (error) {
      print("Error: $error");

      /*  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
        ),
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    Widget size() {
      return SizedBox(
        height: 0,
        width: double.infinity,
        child: Divider(
          //color: Color.fromARGB(255, 0, 0, 0),
          color: Colors.grey,
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'update_time'.tr,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              'project'.tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // Expanded 1
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            widget.selectedProject ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              'client'.tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // Expanded
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            widget.selectedClientName ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Time in".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextButton(
                            onPressed: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040),
                              );

                              if (pickedDate != null &&
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              _getCurrentDate(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextButton(
                            onPressed: () async {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );

                              if (pickedTime != null &&
                                  pickedTime != selectedTime) {
                                setState(() {
                                  selectedTime = pickedTime;
                                });
                              }
                            },
                            child: Text(
                              _getCurrentTime(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Time out".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextButton(
                            onPressed: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate2,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040),
                              );

                              if (pickedDate != null &&
                                  pickedDate != selectedDate2) {
                                setState(() {
                                  selectedDate2 = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              _getCurrentDate2(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextButton(
                            onPressed: () async {
                              final TimeOfDay? pickedTime2 =
                                  await showTimePicker(
                                context: context,
                                initialTime: selectedTime2,
                              );

                              if (pickedTime2 != null &&
                                  pickedTime2 != selectedTime2) {
                                setState(() {
                                  selectedTime2 = pickedTime2;
                                });
                              }
                            },
                            child: Text(
                              _getCurrentTime2(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Break".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-9]+$'),
                              ),
                            ],
                            decoration: InputDecoration(
                              hintText: "Minutes".tr,
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            controller: _breakController,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Center(
                              child: Text(
                            "Working hours".tr,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextButton(
                            onPressed: () async {
                              final TimeOfDay? pickedTimeHours =
                                  await showTimePicker(
                                context: context,
                                initialTime: selectedTimeWorking,
                              );

                              if (pickedTimeHours != null &&
                                  pickedTimeHours != selectedTimeWorking) {
                                setState(() {
                                  selectedTimeWorking = pickedTimeHours;
                                });
                              }
                            },
                            child: Text(
                              _getWorkingHours(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Center(
                              child: Text(
                            "Hourly Rate".tr,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9]+$'))
                            ],
                            decoration: InputDecoration(
                              hintText: "Amount".tr,
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            controller: _hourlyRateController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Description".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "what task have you done?".tr,
                            ),
                            style: TextStyle(fontWeight: FontWeight.w500),
                            controller: _descriptionController,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Icon(Icons.menu),
                        ))
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Notes".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "",
                            ),
                            style: TextStyle(fontWeight: FontWeight.w500),
                            controller: _notesController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Status",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          _showStatusDialog(context);
                        },
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "open",
                              ),
                              style: TextStyle(fontWeight: FontWeight.w500),
                              controller: _statusController,
                              enabled: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Tags",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          _showTagDialog(context);
                        },
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Company",
                              ),
                              style: TextStyle(fontWeight: FontWeight.w500),
                              controller: _tagsController,
                              enabled: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Billable".tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          child: Switch(
                              value: status1,
                              onChanged: (val) {
                                print("object");
                                setState(() {
                                  status1 = val;
                                });
                              }),
                        )),
                  ],
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color.fromARGB(255, 221, 221, 223),
                  onPressed: () {},
                  child: Text("Add Expense / Deduction".tr),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color.fromARGB(255, 221, 221, 223),
                  onPressed: () {},
                  child: Text("Add Mileage".tr),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Color.fromARGB(255, 221, 221, 223),
                        onPressed: () {
                          _saveApi();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Time()),
                          );
                        },
                        child: Text("save ".tr),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Status"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _statusOptions
                .map((status) => ListTile(
                      title: Text(status),
                      onTap: () {
                        setState(() {
                          _selectedStatus = status;
                          _statusController.text = status;
                        });
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  void _showTagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Tags"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _tagsOptions
                .map((tag) => ListTile(
                      title: Text(tag),
                      onTap: () {
                        setState(() {
                          _selectedTags = tag;
                          _tagsController.text = tag;
                        });
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  void main() => runApp(UpdateTime());
}
