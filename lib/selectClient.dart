import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet_1/second.dart';
import 'package:timesheet_1/update_time.dart';

// Define the Customer class
class Customer {
  final String name;
  final String description;
  final String address;
  final String phone;
  final String fax;
  final String email;

  Customer(this.name, this.description, this.address, this.phone, this.fax,
      this.email);

  factory Customer.fromString(String clientstring) {
    List<String> parts = clientstring.split('|');
    if (parts.length != 6) {
      throw FormatException('Invalid client string: $clientstring');
    }
    return Customer(
      parts[0], // Name
      parts[1], // Description
      parts[2], // Address
      parts[3], // Phone
      parts[4], // Fax
      parts[5], // Email
    );
  }

  String toString() {
    return '$name|$description|$address|$phone|$fax|$email';
  }
}

// Client Addition Page
class ClientAdditionPage extends StatefulWidget {
  @override
  _ClientAdditionPageState createState() => _ClientAdditionPageState();
}

class _ClientAdditionPageState extends State<ClientAdditionPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _faxController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

// Function to save the customer
  Future<Customer?> _saveCustomer() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String address = _addressController.text;
    String phone = _phoneController.text;
    String fax = _faxController.text; // Added fax
    String email = _emailController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedclients = prefs.getStringList('clients') ?? [];
    savedclients.add(
        Customer(name, description, address, phone, fax, email).toString());
    await prefs.setStringList('clients', savedclients);

    // Clear input fields after saving
    _nameController.clear();
    _descriptionController.clear();
    _addressController.clear();
    _phoneController.clear();
    _faxController.clear();
    _emailController.clear();

    // Return the new customer
    return Customer(name, description, address, phone, fax, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _faxController,
              decoration: InputDecoration(labelText: 'Fax'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Customer? newClient = await _saveCustomer();
                if (newClient != null) {
                  Navigator.pop(context, newClient);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
