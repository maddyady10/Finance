import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart'; // For date formatting

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _dob; // Date of birth
  final TextEditingController _monthlyIncomeController = TextEditingController();
  final TextEditingController _savingsController = TextEditingController();
  final TextEditingController _healthCostController = TextEditingController();
  final TextEditingController _investmentsController = TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();

  String _selectedRetirementAge = 'Select Retirement Age'; // Default retirement age option
  String? _maritalStatus; // No default marital status

  // For DOB selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Scroll view for handling long forms
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Name Input
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              SizedBox(height: 20),

              // Date of Birth Input
              Row(
                children: [
                  Text(
                    _dob == null ? "Date of Birth" : DateFormat.yMd().format(_dob!),
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text("Select Date"),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Monthly Income Input
              TextField(
                controller: _monthlyIncomeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Monthly Income"),
              ),
              SizedBox(height: 20),

              // Expected Retirement Age Dropdown
              DropdownButton<String>(
                value: _selectedRetirementAge,
                items: <String>[
                  'Select Age',
                  '55', '60', '65', 'Already Retired'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRetirementAge = newValue!;
                  });
                },
                isExpanded: true,
                hint: Text('Select Expected Retirement Age'),
              ),
              SizedBox(height: 20),

              // Marital Status Dropdown (No default value)
              DropdownButton<String>(
                value: _maritalStatus,
                items: <String>[
                  'Single', 'Married', 'Widowed'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _maritalStatus = newValue!;
                  });
                },
                isExpanded: true,
                hint: Text('Select Marital Status'),
              ),
              SizedBox(height: 20),

              // Savings Input
              TextField(
                controller: _savingsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Total Savings"),
              ),
              SizedBox(height: 20),

              // Health Cost Estimate Input
              TextField(
                controller: _healthCostController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Health Cost Estimate (Monthly)"),
              ),
              SizedBox(height: 20),

              // Investments Input
              TextField(
                controller: _investmentsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Investments"),
              ),
              SizedBox(height: 20),

              // Loan Amount to Pay Per Month Input
              TextField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Loan Amount to Pay (Monthly)"),
              ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // Handle submission logic here
                  print("User details saved");
                  print("Name: ${_nameController.text}");
                  print("DOB: ${_dob != null ? DateFormat.yMd().format(_dob!) : 'Not Set'}");
                  print("Monthly Income: ${_monthlyIncomeController.text}");
                  print("Expected Retirement Age: $_selectedRetirementAge");
                  print("Marital Status: $_maritalStatus");
                  print("Savings: ${_savingsController.text}");
                  print("Health Cost: ${_healthCostController.text}");
                  print("Investments: ${_investmentsController.text}");
                  print("Loan Amount: ${_loanAmountController.text}");
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
