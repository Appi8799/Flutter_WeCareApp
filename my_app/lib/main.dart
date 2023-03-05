import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/addPatientData.dart';
import 'package:my_app/addPatientRecord.dart';
import 'package:my_app/logInPage.dart';
import 'package:my_app/viewAllCriticalPatient.dart';

import 'viewAllPatientData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyHomePageApp());
}

class MyHomePageApp extends StatelessWidget {
  const MyHomePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'WeCare',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WeCare'),
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
        body: const WeCare(),
      ),
    );
  }
}

class WeCare extends StatefulWidget {
  const WeCare({super.key});

  @override
  WeCareAppState createState() {
    return WeCareAppState();
  }
}

class WeCareAppState extends State<WeCare> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 450,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Search here...',
                      labelText: 'Search here...',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "SEARCH",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const MyButtons()
            ],
          ),
        ),
      ],
    );
  }
}

class MyButtons extends StatefulWidget {
  const MyButtons({super.key});

  @override
  MyButtonsState createState() {
    return MyButtonsState();
  }
}

class MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPatientData()),
                  );
                },
                child: const Text(
                  "Add Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewAllPatient()),
                  );
                },
                child: const Text(
                  "View All Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewCriticalPatient()),
                  );
                },
                child: const Text(
                  "View All Critical Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPatientRecord()),
                  );
                },
                child: const Text(
                  "Add Patient Record",
                  style: TextStyle(color: Colors.white),
                  selectionColor: Colors.lightGreenAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
