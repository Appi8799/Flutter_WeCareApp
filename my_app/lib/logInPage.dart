//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'main.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const LogInPage());
// }

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeCare - SignIn'),
      ),
      body: const WeCareLogIn(),
    );
  }
}

class WeCareLogIn extends StatefulWidget {
  const WeCareLogIn({super.key});

  @override
  WeCareLogInStatus createState() {
    return WeCareLogInStatus();
  }
}

class WeCareLogInStatus extends State<WeCareLogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: <Widget>[
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person, color: Colors.black),
                hintText: 'Enter username',
                labelText: 'Username',
              ),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range, color: Colors.black),
                hintText: 'Enter password',
                labelText: 'Password',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePageApp()),
                  );
                },
                child: const Text(
                  "Add Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
