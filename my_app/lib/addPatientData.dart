// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'addPatientRecord.dart';
import 'logInPage.dart';
import 'viewAllPatientData.dart';

class AddPatientData extends StatelessWidget {
  const AddPatientData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Patient"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInPage()),
                );
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: const PatientData(),
    );
  }
}

class PatientData extends StatefulWidget {
  const PatientData({super.key});

  @override
  NewPatientState createState() {
    return NewPatientState();
  }
}

class NewPatientState extends State<PatientData> {
  // ignore: prefer_typing_uninitialized_variables
  var selectedType;

  final patientNameController = TextEditingController();
  final patientDobController = TextEditingController();
  final patientAddressController = TextEditingController();
  final patientContactController = TextEditingController();
  final patientEmailController = TextEditingController();
  final patientAllergyController = TextEditingController();
  final patientStatusController = TextEditingController();
  final patientEmerNameController = TextEditingController();
  final patientEmerContactController = TextEditingController();

  late DatabaseReference dbRef;

  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

  final List<String> _status = <String>['Normal', 'Moderate', 'Critical'];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('PatientData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyValue,
        //autovalidateMode: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: <Widget>[
            const SizedBox(height: 20),
            TextFormField(
              controller: patientNameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person, color: Colors.black),
                hintText: 'Enter fullname',
                labelText: 'PatientName',
              ),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              controller: patientDobController,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range, color: Colors.black),
                hintText: 'Enter DateOfBirth',
                labelText: 'DOB',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              minLines: 2,
              maxLines: 4,
              controller: patientAddressController,
              decoration: const InputDecoration(
                icon: Icon(Icons.home, color: Colors.black),
                hintText: 'Enter Full Address',
                labelText: 'Address',
              ),
              keyboardType: TextInputType.streetAddress,
            ),
            TextFormField(
              controller: patientContactController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone, color: Colors.black),
                hintText: 'Enter Contact Number',
                labelText: 'Contact Number',
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: patientEmailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email, color: Colors.black),
                hintText: 'Enter Email ID',
                labelText: 'E-mail ID',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: patientAllergyController,
              decoration: const InputDecoration(
                icon: Icon(Icons.coronavirus, color: Colors.black),
                hintText: 'Enter Your Allergies',
                labelText: 'Allergies',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(Icons.add_chart, color: Colors.black, size: 26),
                const SizedBox(width: 12),
                DropdownButton(
                  items: _status
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ))
                      .toList(),
                  onChanged: (selectedStatusType) {
                    setState(() {
                      selectedType = selectedStatusType;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: const Text(
                    '-- Select Status --',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            TextFormField(
              controller: patientEmerNameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.contact_emergency, color: Colors.black),
                hintText: 'Enter Emergency Contact Person Name',
                labelText: 'Emergency Contact Name',
              ),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              controller: patientEmerContactController,
              decoration: const InputDecoration(
                icon: Icon(Icons.contact_emergency, color: Colors.black),
                hintText: 'Enter Emergency Contact Number',
                labelText: 'Emergency Contact Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPatientRecord()),
                      );
                    },
                    icon: const Icon(Icons.add_box,
                        color: Colors.black, size: 30)),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Add Patient Record",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  Map<String, String> patients = {
                    'Patient_Name': patientNameController.text,
                    'DOB': patientDobController.text,
                    'Address': patientAddressController.text,
                    'Contact_No': patientContactController.text,
                    'EmailID': patientEmailController.text,
                    'Allergies': patientAllergyController.text,
                    'Status': patientStatusController.text,
                    'Emergency_Name': patientEmerNameController.text,
                    'Emergency_Contact': patientEmerContactController.text,
                  };
                  dbRef.push().set(patients);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewAllPatient()),
                  );
                },
                child: const Text(
                  "Add Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('selectedType', selectedType));
  }
}
