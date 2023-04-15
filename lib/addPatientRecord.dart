import 'package:flutter/material.dart';
import 'package:milestone_wecare/main.dart';
import 'viewAllPatientData.dart';

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
                  MaterialPageRoute(
                      builder: (context) => const MyHomePageApp()),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Bloodpressure";
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.water_drop_sharp, color: Colors.black),
                hintText: 'Enter blood oxygen level (%)',
                labelText: 'Blood Oxygen Level (%)',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Blood Oxygen Level";
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.rate_review_outlined, color: Colors.black),
                hintText: 'Enter respiratory rate (BPM)',
                labelText: 'Respiratory Rate (BPM)',
              ),
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Respiratory Rate";
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.heat_pump, color: Colors.black),
                hintText: 'Enter heartbeat rate (BPM)',
                labelText: 'Heartbeat Rate (BPM)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Heartbeat Rate";
                }
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 350),
              child: ElevatedButton(
                // onPressed: () {
                //   Map<String, String> records = {
                //     'Bloodpressure': patientBPRateController.text,
                //     'Blood Oxygen Level': patientOxyRateController.text,
                //     'Respiratory Rate': patientRespoRateController.text,
                //     'Heartbeat Rate': patientHeartRateController.text,
                //   };

                //   //onPressed: addRecord,

                //   dbRef
                //       .child(widget.recordKey)
                //       .update(records)
                //       .then((value) => {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const ViewAllPatient()),
                //             )
                //           });
                // },

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewAllPatient()),
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
