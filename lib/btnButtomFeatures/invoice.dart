import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart';
import 'package:timesheet_1/models/showModel.dart';
import 'package:http/http.dart' as http;

class InvoicePage extends StatefulWidget {
  final List<ShowModel> records;

  InvoicePage(this.records);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  late Uint8List _imageBytes;
  late String uniqueCode;

  @override
  void initState() {
    super.initState();
    _loadImage();
    uniqueCode = 'GM${DateTime.now().millisecondsSinceEpoch.toString()}';
  }

  Future<void> _loadImage() async {
    final ByteData imageData = await rootBundle.load('images/timesheet.png');
    _imageBytes = Uint8List.view(imageData.buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Invoice',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Image.asset('images/timesheet.png'),
                //   SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bill To : ${widget.records.first.client}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Date : ${DateTime.now()}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Code : ${uniqueCode}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Project')),
                  DataColumn(label: Text('Client')),
                  DataColumn(label: Text('Time In')),
                  DataColumn(label: Text('Time Out')),
                  DataColumn(label: Text('Rate')),
                  DataColumn(label: Text('Break')),
                  DataColumn(label: Text('Hours')),
                  DataColumn(label: Text('Amount')),
                ],
                rows: widget.records.map((record) {
                  String amount = '';
                  List<String> parts = record.workingHours.split(':');
                  int hours = int.parse(parts[0]);
                  int minutes = int.parse(parts[1]);
                  double totalHours = hours + (minutes / 60);
                  amount = (totalHours * record.hourlyRate).toStringAsFixed(2);
                  return DataRow(
                    cells: [
                      DataCell(Text(record.selectedProject)),
                      DataCell(Text(record.client)),
                      DataCell(Text(record.timeIn.toString())),
                      DataCell(Text(record.timeOut.toString())),
                      DataCell(Text(record.hourlyRate.toString())),
                      DataCell(Text(record.timebreak.toString())),
                      DataCell(Text(record.workingHours.toString())),
                      DataCell(Text(amount)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Total Price: ${calculateTotalAmount(widget.records)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _generatePDF();
            _sendToApi();
          });
        },
        child: Icon(Icons.picture_as_pdf),
        tooltip: 'Generate PDF',
      ),
    );
  }

  String calculateTotalAmount(List<ShowModel> records) {
    double totalAmount = 0.0;
    for (var record in records) {
      List<String> parts = record.workingHours.split(':');
      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);
      double totalHours = hours + (minutes / 60);
      totalAmount += totalHours * record.hourlyRate;
    }
    return totalAmount.toStringAsFixed(2);
  }

  Future<void> _generatePDF() async {
    final pdf = pw.Document();

    final fontData = await rootBundle.load("fonts/Roboto/Roboto-Regular.ttf");

    String formattedDateTime = "${DateTime.now()}";

    Map<String, List<ShowModel>> groupedRecords = {};
    for (var record in widget.records) {
      if (!groupedRecords.containsKey(record.selectedProject)) {
        groupedRecords[record.selectedProject] = [];
      }
      groupedRecords[record.selectedProject]!.add(record);
    }

    pdf.addPage(pw.MultiPage(
      build: (context) => [
        pw.Container(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Invoice',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: pw.Font.ttf(fontData),
              fontSize: 30,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(left: 10),
          child: pw.Row(
            children: [
              pw.Image(pw.MemoryImage(_imageBytes)),
              pw.SizedBox(width: 20),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Bill To : ${widget.records.first.client}',
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      font: pw.Font.ttf(fontData),
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    'Date : $formattedDateTime',
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      font: pw.Font.ttf(fontData),
                      fontSize: 14,
                    ),
                  ),
                  pw.Text(
                    'Code :$uniqueCode',
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      font: pw.Font.ttf(fontData),
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        for (var entry in groupedRecords.entries)
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                margin: pw.EdgeInsets.only(top: 20, bottom: 10),
                child: pw.Text(
                  'Project: ${entry.key}',
                  style: pw.TextStyle(
                    font: pw.Font.ttf(fontData),
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.Table.fromTextArray(
                context: context,
                headerAlignment: pw.Alignment.centerLeft,
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
                headerHeight: 30,
                cellHeight: 30,
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold)
                    .copyWith(font: pw.Font.ttf(fontData)),
                cellStyle: pw.TextStyle().copyWith(font: pw.Font.ttf(fontData)),
                data: <List<String>>[
                  <String>[
                    'Time In',
                    'Time Out',
                    'Rate',
                    'Break',
                    'Hours',
                    'Amount'
                  ],
                  for (final record in entry.value)
                    [
                      record.timeIn.toString(),
                      record.timeOut.toString(),
                      record.hourlyRate.toString(),
                      record.timebreak.toString(),
                      record.workingHours.toString(),
                      ((double.parse(record.workingHours.split(':')[0]) +
                                  double.parse(
                                          record.workingHours.split(':')[1]) /
                                      60) *
                              record.hourlyRate)
                          .toStringAsFixed(2),
                    ],
                ],
              ),
            ],
          ),
        pw.Container(
          margin: pw.EdgeInsets.only(top: 20),
          child: pw.Text(
            'Total Price: ${calculateTotalAmount(widget.records)}\$',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: pw.Font.ttf(fontData),
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ));

    final dir = await getDownloadsDirectory();
    final fileName = 'invoice_$uniqueCode.pdf';
    final path = '${dir?.path}/$fileName';
    final file = File(path);

    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('PDF generated successfully. Path: $path'),
      duration: Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Open PDF',
        onPressed: () {
          OpenFile.open(path);
        },
      ),
    ));
  }

  Future<void> _sendToApi() async {
    const url = 'http://192.168.1.10:8000/api/invoices';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'project': widget.records.first.selectedProject,
          'client': widget.records.first.client,
          'timeIn': widget.records.first.timeIn.toString(),
          'timeOut': widget.records.first.timeOut.toString(),
          'hourlyRate': widget.records.first.hourlyRate.toString(),
          'workingHours': widget.records.first.workingHours.toString(),
          'amount': calculateTotalAmount(widget.records),
          'formattedDateTime': DateTime.now().toString(),
          'uniqueCode': uniqueCode,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
