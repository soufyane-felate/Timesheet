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
    // استخدم Timer لتأخير انتقال المستخدم إلى الصفحة الرئيسية بعد 5 ثوانٍ
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
      appBar: AppBar(
        title: Text('Temporary Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hiiiii', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            CircularProgressIndicator(), // رمز التحميل أثناء انتظار 5 ثوانٍ
          ],
        ),
      ),
    );
  }
}
