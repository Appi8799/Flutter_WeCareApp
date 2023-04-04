import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:milestone_wecare/main.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('My Profile'),
  //       actions: <Widget>[
  //         IconButton(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => const MyHomePageApp()),
  //               );
  //             },
  //             icon: const Icon(Icons.logout)),
  //       ],
  //     ),
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    return ViewProfileState();
  }
}

class ViewProfileState extends State<ViewProfile> {
  Query dbRef = FirebaseDatabase.instance.ref().child('PatientData');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('PatientData');

  Widget listView({required Map patient}) {
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
          Text(
            patient['DOB'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
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
            return listView(patient: patient);
          },
        ),
      ),
    );
  }
}
