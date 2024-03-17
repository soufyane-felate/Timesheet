import 'package:first_app/TempPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/d1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TempPage(), // استبدل Second() بـ TempPage()
    );
  }
}
