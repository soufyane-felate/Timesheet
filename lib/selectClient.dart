import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet_1/update_time.dart';

void main() => runApp(UpdateTime());

class selectClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Customer> _clients = [];

  @override
  void initState() {
    super.initState();
    _loadclients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientAdditionPage()),
          );

          await _loadclients();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: _buildCustomerList(),
    );
  }

  Widget _buildCustomerList() {
    if (_clients.isEmpty) {
      return Center(child: Text('No clients found'));
    } else {
      return ListView.builder(
        itemCount: _clients.length,
        itemBuilder: (context, index) {
          final customer = _clients[index];
          return ListTile(
            title: Text(customer.name),
            subtitle: Text(customer.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTime(
                    selectedClientName: _clients[index].name,
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }

  Future<void> _loadclients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedclients = prefs.getStringList('clients') ?? [];
    List<Customer> clients = [];

    for (String clientstring in savedclients) {
      try {
        clients.add(Customer.fromString(clientstring));
      } catch (e) {
        print('Error parsing customer: $e');
      }
    }

    setState(() {
      _clients = clients;
    });
  }
}

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
      parts[0], 
      parts[1], 
      parts[2], 
      parts[3], 
      parts[4], 
      parts[5], 
    );
  }

  String toString() {
    return '$name|$description|$address|$phone|$fax|$email';
  }
}

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

  void _saveCustomer() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String address = _addressController.text;
    String phone = _phoneController.text;
    String fax = _faxController.text;
    String email = _emailController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedclients = prefs.getStringList('clients') ?? [];
    savedclients.add(
        Customer(name, description, address, phone, fax, email).toString());
    await prefs.setStringList('clients', savedclients);

    _nameController.clear();
    _descriptionController.clear();
    _addressController.clear();
    _phoneController.clear();
    _faxController.clear();
    _emailController.clear();
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
              onPressed: () {
                _saveCustomer();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
