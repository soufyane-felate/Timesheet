import 'package:first_app/d1.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TempPage extends StatefulWidget {
  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Second()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        title: const Text('Temporary Page'),
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.network(
            //  'https://img.freepik.com/premium-vector/timesheet-time-tracking-icon-white_116137-6652.jpg?w=900'
            // ),
            Image.asset(
              "images/timesheet.png",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
