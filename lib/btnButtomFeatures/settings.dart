import 'package:flutter/material.dart';
import 'package:timesheet_1/btnButtomFeatures/LanguageSelection.dart';
import 'package:timesheet_1/help.dart';
import 'package:get/get.dart';

void main() {
  runApp(settings());
}

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          
          title: Text(
            "settings".tr,
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
        body: ListView(
          children: [
            ListTile(
              title: Text('Help'.tr),
              onTap: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                );
              },
            ),
            ListTile(
              title: Text('language'.tr),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageSelection()),
                );
              },
            ),
            /* ListTile(
              title: Text('Theme'.tr),
              onTap: () {
                
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
