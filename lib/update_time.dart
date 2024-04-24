import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateTime extends StatefulWidget {
  final String? selectedProject;

  UpdateTime({this.selectedProject});

  @override
  _UpdateTimeState createState() => _UpdateTimeState();
}

class _UpdateTimeState extends State<UpdateTime> {
  bool status = false;
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

  @override
  Widget build(BuildContext context) {
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
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "who do you work for?".tr,
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
                                  RegExp(r'^[0-9]+$'))
                            ],
                            decoration: InputDecoration(
                              hintText: "Minutes".tr,
                            ),
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
                              "Status".tr,
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
                        child: Text(
                          "Open".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                              value: status,
                              onChanged: (val) {
                                print("object");
                                setState(() {
                                  status = val;
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
                        onPressed: () {},
                        child: Text("Delete ".tr),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Color.fromARGB(255, 221, 221, 223),
                        onPressed: () {},
                        child: Text("Update ".tr),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Color.fromARGB(255, 221, 221, 223),
                        onPressed: () {},
                        child: Text("Add ".tr),
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
}

void main() => runApp(UpdateTime());
