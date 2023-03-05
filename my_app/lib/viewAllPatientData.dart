import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'logInPage.dart';

class ViewAllPatient extends StatefulWidget {
  const ViewAllPatient({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewAllPatientDataState();
  }
}

class ViewAllPatientDataState extends State<ViewAllPatient> {
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
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   patient['Address'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // Text(
          //   patient['Contact_No'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   patient['EmailID'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   patient['Allergies'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // Text(
          //   patient['Status'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   patient['Emergency_Name'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   patient['Emergency_Contact'],
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Patient Data'),
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
        ));
  }
}
