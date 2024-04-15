import 'package:flutter/material.dart';

void main() {
  runApp(client());
}

class client extends StatefulWidget {
  const client({super.key});

  @override
  State<client> createState() => _clientState();
}

class _clientState extends State<client> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
          title: Text(
            "Client",
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
      ),
    );
  }
}
