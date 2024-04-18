import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLocale = Get.locale; // Check for active locale

    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr), // Translated title
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('arabic'.tr), // Translated "Arabic"
            trailing:
                currentLocale?.languageCode == 'ar' ? Icon(Icons.check) : null,
            onTap: () {
              Get.updateLocale(Locale('ar'));
            },
          ),
          ListTile(
            title: Text('english'.tr), // Translated "English"
            trailing:
                currentLocale?.languageCode == 'en' ? Icon(Icons.check) : null,
            onTap: () {
              Get.updateLocale(Locale('en'));
            },
          ),
          ListTile(
            title: Text('french'.tr), // Translated "French"
            trailing:
                currentLocale?.languageCode == 'fr' ? Icon(Icons.check) : null,
            onTap: () {
              Get.updateLocale(Locale('fr'));
            },
          ),
          ListTile(
            title: Text('german'.tr), // Translated "German"
            trailing:
                currentLocale?.languageCode == 'de' ? Icon(Icons.check) : null,
            onTap: () {
              Get.updateLocale(Locale('de'));
            },
          ),
        ],
      ),
    );
  }
}

class LanguageController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'language': 'Language',
          'arabic': 'Arabic',
          'english': 'English',
          'french': 'Français',
          'german': 'Deutsch',
          'timesheet': 'Timesheet',
          'play_arrow': 'Play',
          'pause': 'Pause',
          'stop': 'Stop',
          'project': 'Project',
          'client': 'Client',
          'day': 'Day',
          'month': 'Month',
          'statistics': 'Statistics',
          'invoice': 'Invoice',
          'settings': 'Settings',
          'data': 'Data',
          'exit': 'Exit',
          'want_to_stop': 'Want to stop?',
          'cancel': 'Cancel',
          'confirm': 'Confirm',
          'hourly_rate': 'Hourly Rate',
          'flat_rate': 'Flat Rate',
          'overtime': 'Overtime',
          'night_shift': 'Night Shift',
          'holiday': 'Holiday',
          'unpaid_leave': 'Unpaid Leave',
          'default_client': 'Default Client',
        },
        'ar': {
          "language": "اللغة",
          "arabic": "العربية",
          "english": "الإنجليزية",
          "french": "الفرنسية",
          "german": "الألمانية",
          "timesheet": "جداول العمل",
          "play_arrow": "تشغيل",
          "pause": "إيقاف مؤقت",
          "stop": "إيقاف",
          "project": "المشروع",
          "client": "العميل",
          "day": "يوم",
          "month": "شهر",
          "statistics": "إحصائيات",
          "invoice": "فاتورة",
          "settings": "إعدادات",
          "data": "بيانات",
          "exit": "خروج",
          "want_to_stop": "هل تريد التوقف؟",
          "cancel": "إلغاء",
          "confirm": "تأكيد",
          "hourly_rate": "معدل بالساعة",
          "flat_rate": "معدل ثابت",
          "overtime": "عمل إضافي",
          "night_shift": "وردية ليلية",
          "holiday": "عطلة رسمية",
          "unpaid_leave": "إجازة غير مدفوعة",
          "default_client": "العميل الافتراضي",
          "Before starting, you have to setup Clients, Projects, and Company in the settings":
              "قبل البدء، يجب عليك إعداد العملاء والمشاريع والشركة في الإعدادات",
          "Click Add Multiple Records icon to add multiple records at once":
              "انقر على أيقونة إضافة سجلات متعددة لإضافة سجلات متعددة دفعة واحدة.",
          "Then you can add time record": "بعد ذلك يمكنك إضافة سجل زمني",
          "You can analyst time records by bar/line chart":
              "يمكنك تحليل سجلات الوقت بواسطة الرسم البياني الشريطي/الخطي",
          "Click Title to change period": "انقر على العنوان لتغيير الفترة",
          "Click Plus icon to add new time record":
              "انقر على أيقونة الزائد لإضافة سجل زمني جديد",
          "Click 'Add Multiple Records' icon to add multiple records at once":
              "انقر على أيقونة 'إضافة سجلات متعددة' لإضافة سجلات متعددة دفعة واحدة",
          "Click Export/Email icon to export/email in HTML, EXCEL or CSV format":
              "انقر على أيقونة التصدير/البريد الإلكتروني للتصدير/البريد الإلكتروني بتنسيق HTML أو EXCEL أو CSV",
          "Click Calendar icon to view in calendar mode":
              "انقر على أيقونة التقويم لعرض الوضع التقويمي",
          "Click Filter icon to filter data by Tag, Status, Client and Project":
              "انقر على أيقونة الفلتر لتصفية البيانات حسب العلامة، الحالة، العميل، والمشروع",
          "Click Sort icon to sort data by Date(default), Amount, Project and Client":
              "انقر على أيقونة الفرز لفرز البيانات حسب التاريخ (الافتراضي)، المبلغ، المشروع، والعميل",
          "Click Time record to update, delete and copy":
              "انقر على سجل الوقت للتحديث، والحذف، والنسخ",
          "Long click Time record for multiple selection":
              "انقر بالضغط المطول على سجل الوقت لتحديد متعدد",
          "Add Hour/Flat Rate Time Record": "إضافة سجل زمني بالساعة/بمعدل ثابت",
          "In project setting, you can choose Hour/Flat Rate":
              "في إعدادات المشروع، يمكنك اختيار الساعة/المعدل الثابت",
          "When you add a new time record, choose the Hour/Flat Rate project":
              "عند إضافة سجل زمني جديد، اختر مشروع الساعة/المعدل الثابت",
          "The new time record will be Hour/Flat Rate based on the project setting":
              "سيكون سجل الوقت الجديد بالساعة/بمعدل ثابت بناءً على إعدادات المشروع",
          "How To Setup Overtime": "كيفية إعداد العمل الإضافي",
          "In project setting, you can choose Daily Overtime, Weekly Overtime, Biweekly Overtime, Monthly Overtime":
              "في إعدادات المشروع، يمكنك اختيار العمل الإضافي اليومي، الأسبوعي، الأسبوعيني، الشهري",
          "In overtime setting, input after how many working hours as overtime, and input rate of overtime":
              "في إعدادات العمل الإضافي، أدخل بعد كم ساعة عمل يتم احتساب العمل الإضافي، وأدخل معدل العمل الإضافي",
          "If you setup weekly overtime in project and first day of week is Sunday, then overtime calculation starts from Sunday on the same project":
              "إذا قمت بإعداد العمل الإضافي الأسبوعي في المشروع وكان اليوم الأول من الأسبوع هو الأحد، فإن حساب العمل الإضافي يبدأ من الأحد في نفس المشروع",
          "How To Setup Premium Hours": "كيفية إعداد ساعات الأجر الإضافية",
          "In project setting, you can choose the premium hour":
              "في إعدادات المشروع، يمكنك اختيار ساعة الأجر الإضافية",
          "In premium hour setting, setup start/end time and date":
              "في إعدادات ساعة الأجر الإضافية، قم بإعداد وقت البداية/النهاية والتاريخ",
          "Premium hour will be calculated based on the project":
              "سيتم احتساب ساعات الأجر الإضافية استنادًا إلى المشروع",
          "Export Time Record": "تصدير سجل الوقت",
          "In the time record screen, click Export/Email icon":
              "في شاشة سجل الوقت، انقر على أيقونة التصدير/البريد الإلكتروني",
          "In the data screen, you can choose time period and filter the data":
              "في شاشة البيانات، يمكنك اختيار الفترة الزمنية وتصفية البيانات",
          "In the format screen, you can choose report format Excel, Html and Csv":
              "في شاشة التنسيق، يمكنك اختيار تنسيق التقرير Excel، Html، و Csv",
          "The report can group date by date, week, status, tag, project and client":
              "يمكن للتقرير تجميع التاريخ حسب التاريخ، الأسبوع، الحالة، العلامة، المشروع، والعميل",
          "The report can be shown by summary or detailed":
              "يمكن عرض التقرير بشكل ملخص أو تفصيلي",
          "You can also sort the column fields in the report":
              "يمكنك أيضًا فرز حقول العمود في التقرير",
          "Import Time Record": "استيراد سجل الوقت",
          "In the time record screen, click import icon":
              "في شاشة سجل الوقت، انقر على أيقونة الاستيراد",
          "You can import time records from other app":
              "يمكنك استيراد سجلات الوقت من تطبيق آخر",
          "The import file is Csv format": "الملف المستورد هو بتنسيق Csv",
          "Invoice": "الفاتورة",
          "Click Plus icon to add new invoice":
              "انقر على أيقونة الزائد لإضافة فاتورة جديدة",
          "Click Invoice record to open by PDF reader":
              "انقر على سجل الفاتورة لفتحه بواسطة قارئ PDF",
          "Add New Invoice": "إضافة فاتورة جديدة",
          "First you have to select Client": "أولاً يجب عليك تحديد العميل",
          "Then you can pick up work hours by clicking \"Hours\", only status in \"open\" or \"follow up\" available":
              "ثم يمكنك اختيار ساعات العمل بالنقر فوق \"الساعات\"، فقط الحالة في \"مفتوح\" أو \"متابعة\" متاحة",
          "Charts": "الرسوم البيانية",
          "Shows monthly amount and hours in bar chart and line chart":
              "يعرض المبلغ الشهري والساعات في الرسم البياني الشريطي والخطي",
          "Click Filter icon to filter by chart data by Project, Client, Tag and Status":
              "انقر على أيقونة الفلتر لتصفية البيانات الرسومية حسب المشروع، العميل، العلامة، والحالة",
          "Click Dollar icon to show amount chart":
              "انقر على أيقونة الدولار لعرض الرسم البياني للمبلغ",
          "How To Backup/Restore Data":
              "كيفية النسخ الاحتياطي/استعادة البيانات",
          "It is import to backup database":
              "من المهم أن يكون هناك نسخ احتياطي لقاعدة البيانات",
          "In the app, you can backup database by email, sdcard or google drive":
              "في التطبيق، يمكنك عمل نسخ احتياطي لقاعدة البيانات عن طريق البريد الإلكتروني، بطاقة SD، أو Google Drive",
          "In the app, you can restore database by sdcard or google drive":
              "في التطبيق، يمكنك استعادة قاعدة البيانات عن طريق بطاقة SD أو Google Drive",
          "How To Purchase": "كيفية الشراء",
          "We have two versions: in-app purchase version and paid version":
              "لدينا نسختين: نسخة الشراء داخل التطبيق والنسخة المدفوعة",
          "The in-app purchase version, you can separately purchase functions (1. Export report in csv, html and excel, 2. Unlimited creating invoice)":
              "في نسخة الشراء داخل التطبيق، يمكنك شراء الوظائف بشكل منفصل (1. تصدير التقرير في صيغة CSV، HTML، و Excel، 2. إنشاء الفواتير بدون حدود)",
          "The paid version includes both functions":
              "النسخة المدفوعة تتضمن كلا الوظيفتين"
        },
        'fr': {
          "language": "Langue",
          "arabic": "Arabe",
          "english": "Anglais",
          "french": "Français",
          "german": "Allemand",
          "timesheet": "Feuille de temps",
          "play_arrow": "Lecture",
          "pause": "Pause",
          "stop": "Arrêt",
          "project": "Projet",
          "client": "Client",
          "day": "Jour",
          "month": "Mois",
          "statistics": "Statistiques",
          "invoice": "Facture",
          "settings": "Paramètres",
          "data": "Données",
          "exit": "Quitter",
          "want_to_stop": "Voulez-vous arrêter ?",
          "cancel": "Annuler",
          "confirm": "Confirmer",
          "hourly_rate": "Taux horaire",
          "flat_rate": "Taux fixe",
          "overtime": "Heures supplémentaires",
          "night_shift": "Travail de nuit",
          "holiday": "Jour férié",
          "unpaid_leave": "Congé non payé",
          "default_client": "Client par défaut",
          "Before starting, you have to setup Clients, Projects, and Company in the settings":
              "Avant de commencer, vous devez configurer les clients, les projets et l'entreprise dans les paramètres",
          "Click Add Multiple Records icon to add multiple records at once":
              "Cliquez sur l'icône Ajouter plusieurs enregistrements pour ajouter plusieurs enregistrements à la fois.",
          "Then you can add time record":
              "Ensuite, vous pouvez ajouter un enregistrement de temps",
          "You can analyst time records by bar/line chart":
              "Vous pouvez analyser les enregistrements de temps par diagramme à barres/ligne",
          "How To Setup Overtime":
              "Comment configurer les heures supplémentaires",
          "In project setting, you can choose Daily Overtime, Weekly Overtime, Biweekly Overtime, Monthly Overtime":
              "Dans les paramètres du projet, vous pouvez choisir les heures supplémentaires quotidiennes, hebdomadaires, bihebdomadaires ou mensuelles",
          "If you setup weekly overtime in project and first day of week is Sunday, then overtime calculation starts from Sunday on the same project":
              "Si vous configurez les heures supplémentaires hebdomadaires dans le projet et que le premier jour de la semaine est le dimanche, le calcul des heures supplémentaires commence à partir du dimanche sur le même projet",
          "How To Setup Premium Hours": "Comment configurer les heures premium",
          "In project setting, you can choose the premium hour":
              "Dans les paramètres du projet, vous pouvez choisir l'heure premium",
          "In premium hour setting, setup start/end time and date":
              "Dans les paramètres de l'heure premium, configurez l'heure de début/fin et la date",
          "Premium hour will be calculated based on the project":
              "L'heure premium sera calculée en fonction du projet",
          "Export Time Record": "Exporter le relevé de temps",
          "In the time record screen, click Export/Email icon":
              "Dans l'écran de relevé de temps, cliquez sur l'icône Exporter/Envoyer par e-mail",
          "In the data screen, you can choose time period and filter the data":
              "Dans l'écran des données, vous pouvez choisir la période de temps et filtrer les données",
          "In the format screen, you can choose report format Excel, Html and Csv":
              "Dans l'écran de format, vous pouvez choisir le format de rapport Excel, Html et Csv",
          "The report can group date by date, week, status, tag, project and client":
              "Le rapport peut regrouper la date par date, semaine, état, tag, projet et client",
          "The report can be shown by summary or detailed":
              "Le rapport peut être présenté de manière synthétique ou détaillée",
          "You can also sort the column fields in the report":
              "Vous pouvez également trier les champs de colonne dans le rapport",
          "Import Time Record": "Importer le relevé de temps",
          "In the time record screen, click import icon":
              "Dans l'écran de relevé de temps, cliquez sur l'icône d'importation",
          "You can import time records from other app":
              "Vous pouvez importer des relevés de temps depuis une autre application",
          "The import file is Csv format":
              "Le fichier d'importation est au format Csv",
          "Invoice": "Facture",
          "Click Plus icon to add new invoice":
              "Cliquez sur l'icône Plus pour ajouter une nouvelle facture",
          "Click Invoice record to open by PDF reader":
              "Cliquez sur l'enregistrement de la facture pour l'ouvrir avec un lecteur PDF",
          "Add New Invoice": "Ajouter une nouvelle facture",
          "First you have to select Client":
              "D'abord, vous devez sélectionner un client",
          "Then you can pick up work hours by clicking \"Hours\", only status in \"open\" or \"follow up\" available":
              "Ensuite, vous pouvez récupérer les heures de travail en cliquant sur \"Heures\", seules les statuts \"ouvert\" ou \"en cours\" sont disponibles",
          "Charts": "Graphiques",
          "Shows monthly amount and hours in bar chart and line chart":
              "Montre le montant mensuel et les heures dans un diagramme à barres et un diagramme linéaire",
          "Click Filter icon to filter by chart data by Project, Client, Tag and Status":
              "Cliquez sur l'icône de filtre pour filtrer les données du graphique par projet, client, tag et état",
          "Click Dollar icon to show amount chart":
              "Cliquez sur l'icône Dollar pour afficher le graphique du montant",
          "How To Backup/Restore Data":
              "Comment sauvegarder/restaurer les données",
          "It is import to backup database":
              "Il est important de sauvegarder la base de données",
          "In the app, you can backup database by email, sdcard or google drive":
              "Dans l'application, vous pouvez sauvegarder la base de données par e-mail, carte SD ou Google Drive",
          "In the app, you can restore database by sdcard or google drive":
              "Dans l'application, vous pouvez restaurer la base de données par carte SD ou Google Drive",
          "How To Purchase": "Comment acheter",
          "We have two versions: in-app purchase version and paid version":
              "Nous avons deux versions : une version avec achat intégré dans l'application et une version payante",
          "The in-app purchase version, you can separately purchase functions (1. Export report in csv, html and excel, 2. Unlimited creating invoice)":
              "Dans la version avec achat intégré dans l'application, vous pouvez acheter séparément les fonctions (1. Exporter le rapport en CSV, HTML et Excel, 2. Création illimitée de factures)",
          "The paid version includes both functions":
              "La version payante comprend les deux fonctions"
        },
        'de': {
          "language": "Sprache",
          "arabic": "Arabisch",
          "english": "Englisch",
          "french": "Französisch",
          "german": "Deutsch",
          "timesheet": "Arbeitsblatt",
          "play_arrow": "Abspielen",
          "pause": "Pause",
          "stop": "Stoppen",
          "project": "Projekt",
          "client": "Kunde",
          "day": "Tag",
          "month": "Monat",
          "statistics": "Statistiken",
          "invoice": "Rechnung",
          "settings": "Einstellungen",
          "data": "Daten",
          "exit": "Beenden",
          "want_to_stop": "Möchten Sie aufhören?",
          "cancel": "Abbrechen",
          "confirm": "Bestätigen",
          "hourly_rate": "Stundensatz",
          "flat_rate": "Pauschalpreis",
          "overtime": "Überstunden",
          "night_shift": "Nachtschicht",
          "holiday": "Feiertag",
          "unpaid_leave": "Unbezahlter Urlaub",
          "default_client": "Standardkunde",
          "Before starting, you have to setup Clients, Projects, and Company in the settings":
              "Bevor Sie beginnen, müssen Sie Kunden, Projekte und Unternehmen in den Einstellungen einrichten",
          "Click Add Multiple Records icon to add multiple records at once":
              "Klicken Sie auf das Symbol Mehrere Datensätze hinzufügen, um mehrere Datensätze auf einmal hinzuzufügen.",
          "Then you can add time record":
              "Dann können Sie einen Zeiteintrag hinzufügen",
          "You can analyst time records by bar/line chart":
              "Sie können Zeitaufzeichnungen mit Balken-/Liniendiagramm analysieren",
          "How To Setup Overtime": "So richten Sie Überstunden ein",
          "In project setting, you can choose Daily Overtime, Weekly Overtime, Biweekly Overtime, Monthly Overtime":
              "In den Projekteinstellungen können Sie Tägliche Überstunden, Wöchentliche Überstunden, Alle zwei Wochen Überstunden, Monatliche Überstunden auswählen",
          "If you setup weekly overtime in project and first day of week is Sunday, then overtime calculation starts from Sunday on the same project":
              "Wenn Sie wöchentliche Überstunden im Projekt einrichten und der erste Tag der Woche Sonntag ist, beginnt die Berechnung der Überstunden am Sonntag im gleichen Projekt",
          "How To Setup Premium Hours": "So richten Sie Premium-Stunden ein",
          "In project setting, you can choose the premium hour":
              "In den Projekteinstellungen können Sie die Premium-Stunde auswählen",
          "In premium hour setting, setup start/end time and date":
              "In den Einstellungen für Premiumstunden, Einrichtungsstart-/Endzeit und Datum",
          "Premium hour will be calculated based on the project":
              "Die Premiumstunde wird auf Basis des Projekts berechnet",
          "Export Time Record": "Zeitaufzeichnung exportieren",
          "In the time record screen, click Export/Email icon":
              "Klicken Sie im Bildschirm Zeitaufzeichnung auf das Symbol Exportieren/E-Mail",
          "In the data screen, you can choose time period and filter the data":
              "Im Datenbildschirm können Sie den Zeitraum auswählen und die Daten filtern",
          "In the format screen, you can choose report format Excel, Html and Csv":
              "Im Formatbildschirm können Sie das Berichtsformat Excel, HTML und CSV auswählen",
          "The report can group date by date, week, status, tag, project and client":
              "Der Bericht kann nach Datum, Woche, Status, Tag, Projekt und Kunde gruppiert werden",
          "The report can be shown by summary or detailed":
              "Der Bericht kann als Zusammenfassung oder detailliert angezeigt werden",
          "You can also sort the column fields in the report":
              "Sie können auch die Spaltenfelder im Bericht sortieren",
          "Import Time Record": "Zeitaufzeichnung importieren",
          "In the time record screen, click import icon":
              "Im Bildschirm Zeitaufzeichnung auf das Import-Symbol klicken",
          "You can import time records from other app":
              "Sie können Zeitaufzeichnungen aus anderen Apps importieren",
          "The import file is Csv format": "Die Importdatei ist im CSV-Format",
          "Invoice": "Rechnung",
          "Click Plus icon to add new invoice":
              "Klicken Sie auf das Plus-Symbol, um eine neue Rechnung hinzuzufügen",
          "Click Invoice record to open by PDF reader":
              "Klicken Sie auf den Rechnungseintrag, um ihn mit einem PDF-Reader zu öffnen",
          "Add New Invoice": "Neue Rechnung hinzufügen",
          "First you have to select Client":
              "Zuerst müssen Sie den Kunden auswählen",
          "Then you can pick up work hours by clicking \"Hours\", only status in \"open\" or \"follow up\" available":
              "Dann können Sie Arbeitsstunden auswählen, indem Sie auf \"Stunden\" klicken, nur Status in \"offen\" oder \"Nachverfolgung\" verfügbar",
          "Charts": "Diagramme",
          "Shows monthly amount and hours in bar chart and line chart":
              "Zeigt monatlichen Betrag und Stunden in Balken- und Liniendiagramm",
          "Click Filter icon to filter by chart data by Project, Client, Tag and Status":
              "Klicken Sie auf das Filter-Symbol, um die Diagrammdaten nach Projekt, Kunde, Tag und Status zu filtern",
          "Click Dollar icon to show amount chart":
              "Klicken Sie auf das Dollar-Symbol, um das Betragsdiagramm anzuzeigen",
          "How To Backup/Restore Data": "So sichern/Wiederherstellen von Daten",
          "It is import to backup database":
              "Es ist wichtig, die Datenbank zu sichern",
          "In the app, you can backup database by email, sdcard or google drive":
              "In der App können Sie die Datenbank per E-Mail, SD-Karte oder Google Drive sichern",
          "In the app, you can restore database by sdcard or google drive":
              "In der App können Sie die Datenbank per SD-Karte oder Google Drive wiederherstellen",
          "How To Purchase": "Wie man kauft",
          "We have two versions: in-app purchase version and paid version":
              "Wir haben zwei Versionen: In-App-Kaufversion und kostenpflichtige Version",
          "The in-app purchase version, you can separately purchase functions (1. Export report in csv, html and excel, 2. Unlimited creating invoice)":
              "In der In-App-Kaufversion können Sie Funktionen separat kaufen (1. Bericht exportieren in CSV, HTML und Excel, 2. Unbegrenztes Erstellen von Rechnungen)",
          "The paid version includes both functions":
              "Die kostenpflichtige Version enthält beide Funktionen"
        },
      };
}
