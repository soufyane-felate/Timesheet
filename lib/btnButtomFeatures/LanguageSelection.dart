import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLocale = Get.locale;
    final List<Locale> supportedLocales = [
      Locale('en', 'US'),
      Locale('ar', 'SA'),
      Locale('fr', 'FR'),
      Locale('de', 'DE'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr),
      ),
      body: ListView.builder(
        itemCount: supportedLocales.length,
        itemBuilder: (context, index) {
          final locale = supportedLocales[index];
          return ListTile(
            title: Text(_getLocaleName(locale)),
            trailing: currentLocale?.languageCode == locale.languageCode
                ? Icon(Icons.check)
                : null,
            onTap: () async {
              Get.updateLocale(locale);

              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('locale', locale.languageCode);
            },
          );
        },
      ),
    );
  }

  String _getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English'.tr;
      case 'ar':
        return 'العربية'.tr;
      case 'fr':
        return 'Français'.tr;
      case 'de':
        return 'Deutsch'.tr;
      default:
        return '';
    }
  }
}
