import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet_1/btnButtomFeatures/language_controller.dart';
import 'package:timesheet_1/second.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLocale = prefs.getString('locale');

  runApp(MyApp(savedLocale));
}

class MyApp extends StatelessWidget {
  final String? savedLocale;

  MyApp(this.savedLocale);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      translations: LanguageController(),
      locale: savedLocale != null ? Locale(savedLocale!) : Locale('en'),
      fallbackLocale: Locale('en'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(Second());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "images/timesheet.png",
          color: Colors.white,
        ),
      ),
    );
  }
}

