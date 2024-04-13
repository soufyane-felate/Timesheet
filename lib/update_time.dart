import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(UpdateTime());
}

class UpdateTime extends StatelessWidget {
  bool status = false;

  Widget size() {
    return SizedBox(
      height: 0,
      width: double.infinity,
      child: Divider(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "Update Time",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Project",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "client2",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Client",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "who do you work for?",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Time in",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "08/04",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "21:30",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Time out",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "08/04",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            "21:30",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Break",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Minutes",
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
                                "Working hours",
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
                          child: Text(
                            "00:00",
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
                                "Hourly Rate",
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
                          child: Text(
                            "10",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Break",
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
                              hintText: "what task have you done?",
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
                        height: 45,
                        color: Color.fromARGB(255, 221, 221, 223),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Text(
                              "Notes",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: TextField(),
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
                        height: 45,
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
                      child: Container(
                        height: 45,
                        color: Colors.white,
                        child: Text(
                          "Open",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                size(),
                /*  Switch(
                    value: status,
                    onChanged: (val) {
                      print("object");
                      setState(() {
                        status = val;
                      });
                 }),  */
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color.fromARGB(255, 221, 221, 223),
                  onPressed: () {},
                  child: Text("Add Expense /  Deduction"),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color.fromARGB(255, 221, 221, 223),
                  onPressed: () {},
                  child: Text("Add Mileage"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
