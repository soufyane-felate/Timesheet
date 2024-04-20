import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Help extends StatelessWidget {
  const Help({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 19, 18),
        title: Text(
          "Help".tr,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'How To Use'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 33, 22, 2),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '''1- ${'Before starting, you have to setup Clients, Projects, and Company in the settings'.tr}
2- ${'Then you can add time record'.tr}
3- ${'You can analyst time records by bar/line chart'.tr}
4- ${'You may export time records in HTML, EXCEL, and CSV file format'.tr}
5- ${'You may invoice time record in PDF and send to client for the payment'.tr}''',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Timesheet'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('''1- ${'Click Title to change period'.tr}
2- ${'Click Plus icon to add new time record'.tr}
3- ${'Click \'Add Multiple Records\' icon to add multiple records at once'.tr}
4- ${'Click Export/Email icon to export/email in HTML, EXCEL or CSV format'.tr}
5- ${'Click Calendar icon to view in calendar mode'.tr}
6- ${'Click Filter icon to filter data by Tag, Status, Client and Project'.tr}
7- ${'Click Sort icon to sort data by Date(default), Amount, Project and Client'.tr}
8- ${'Click Time record to update, delete and copy'.tr}
9- ${'Long click Time record for multiple selection'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Add Hour/Flat Rate Time Record'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''1- ${'In project setting, you can choose Hour/Flat Rate'.tr}
2- ${'When you add a new time record, choose the Hour/Flat Rate project'.tr}
3- ${'The new time record will be Hour/Flat Rate based on the project setting'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'How To Setup Premium Hours'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''
1- ${'In project setting, you can choose the premium hour'.tr}
2- ${'In premium hour setting, setup start/end time and date'.tr}
3- ${'Premium hour will be calculated based on the project'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Export Time Record'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''
1- ${'In the time record screen, click Export/Email icon'.tr}
2- ${'In the data screen, you can choose time period and filter the data'.tr}
3- ${'In the format screen, you can choose report format Excel, Html and Csv'.tr}
4- ${'The report can group date by date, week, status, tag, project and client'.tr}
5- ${'The report can be shown by summary or detailed'.tr}
6- ${'You can also sort the column fields in the report'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Import Time Record'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 15),
            Text('''1- ${'In the time record screen, click import icon'.tr}
2- ${'You can import time records from other app'.tr}
3- ${'The import file is Csv format'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Invoice'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('''1- ${'Click Plus icon to add new invoice'.tr}
2- ${'Click Invoice record to open by PDF reader'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Add New Invoice'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('''1- ${'First you have to select Client'.tr}
2- ${'Then you can pick up work hours by clicking "Hours", only status in "open" or "follow up" available'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'Charts'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
                '''1- ${'Shows monthly amount and hours in bar chart and line chart'.tr}
2- ${'Click Filter icon to filter by chart data by Project, Client, Tag and Status'.tr}
3- ${'Click Dollar icon to show amount chart'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'How To Backup/Restore Data'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text('''1- ${'It is import to backup database'.tr}
2- ${'In the app, you can backup database by email, sdcard or google drive'.tr}
3- ${'In the app, you can restore database by sdcard or google drive'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'How To Purchase'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 22, 2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
                '''1- ${'We have two versions: in-app purchase version and paid version'.tr}
2- ${'The in-app purchase version, you can separately purchase functions (1. Export report in csv, html and excel, 2. Unlimited creating invoice)'.tr}
3- ${'The paid version includes both functions'.tr}''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
