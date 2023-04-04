import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:milestone_wecare/UpdatePatientData.dart';
import 'package:milestone_wecare/main.dart';
import 'package:milestone_wecare/viewProfile.dart';

class ViewCriticalPatient extends StatefulWidget {
  const ViewCriticalPatient({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewCriticalPatientState();
  }
}

class ViewCriticalPatientState extends State<ViewCriticalPatient> {
  Query dbRef = FirebaseDatabase.instance.ref().child('PatientData');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('PatientData');

  Widget listItem({required Map patient}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.lightGreenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patient['Patient_Name'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            patient['DOB'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProfile()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.accessibility,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpdatePatient(patientKey: patient['key']),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(patient['key']).remove();
                },
                child: Row(children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red[700],
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Critical Patient Data'),
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
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map patient = snapshot.value as Map;
            patient['key'] = snapshot.key;
            return listItem(patient: patient);
          },
        ),
      ),
    );
  }
}
