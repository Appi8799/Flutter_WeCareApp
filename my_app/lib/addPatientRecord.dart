import 'package:flutter/material.dart';

import 'addPatientData.dart';
import 'logInPage.dart';

class AddPatientRecord extends StatelessWidget {
  const AddPatientRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Record'),
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
      body: const PatientRecord(),
    );
  }
}

class PatientRecord extends StatefulWidget {
  const PatientRecord({super.key});

  @override
  NewRecordState createState() {
    return NewRecordState();
  }
}

class NewRecordState extends State<PatientRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: <Widget>[
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.monitor_heart_sharp, color: Colors.black),
                hintText: 'Enter bp level (mmHg)',
                labelText: 'Bloodpressure Rate (mmHg)',
              ),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.water_drop_sharp, color: Colors.black),
                hintText: 'Enter blood oxygen level (%)',
                labelText: 'Blood Oxygen Level (%)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.rate_review_outlined, color: Colors.black),
                hintText: 'Enter respiratory rate (BPM)',
                labelText: 'Respiratory Rate (BPM)',
              ),
              keyboardType: TextInputType.streetAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.heat_pump, color: Colors.black),
                hintText: 'Enter heartbeat rate (BPM)',
                labelText: 'Heartbeat Rate (BPM)',
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 350),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPatientData()),
                  );
                },
                child: const Text(
                  "Add Patient Record",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
