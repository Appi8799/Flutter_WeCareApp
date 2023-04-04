import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:milestone_wecare/main.dart';
import 'addPatientRecord.dart';

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
                  MaterialPageRoute(
                      builder: (context) => const MyHomePageApp()),
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
  State<StatefulWidget> createState() {
    return NewPatientState();
  }
}

class NewPatientState extends State<PatientData> {
  final patientNameController = TextEditingController();
  final patientDobController = TextEditingController();
  final patientAddressController = TextEditingController();
  final patientContactController = TextEditingController();
  final patientEmailController = TextEditingController();
  final patientAllergyController = TextEditingController();
  final patientEmerNameController = TextEditingController();
  final patientEmerContactController = TextEditingController();

  final DatabaseReference = FirebaseDatabase.instance.reference();
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

  List<String> _status = ['Normal', 'Moderate', 'Critical'];
  String selectedType = 'Normal';

  @override
  void savedata() {
    String Patient_Name = patientNameController.text.trim();
    String DOB = patientDobController.text.trim();
    String Address = patientAddressController.text.trim();
    String Contact_No = patientContactController.text.trim();
    String EmailID = patientEmailController.text.trim();
    String Allergies = patientAllergyController.text.trim();
    String Emergency_Name = patientEmerNameController.text.trim();
    String Emergency_Contact = patientEmerContactController.text.trim();

    DatabaseReference.child("PatientData").push().set({
      'Patient_Name': Patient_Name,
      'DOB': DOB,
      'Address': Address,
      'Contact_No': Contact_No,
      'Emaild-ID': EmailID,
      'Allergies': Allergies,
      'Status': selectedType,
      'Emergency_Name': Emergency_Name,
      'Emergency_Contact': Emergency_Contact,
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPatientRecord()),
    );

    setState(() {
      selectedType = _status[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyValue,
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
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Fullname";
                }
              },
            ),
            TextFormField(
              controller: patientDobController,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range, color: Colors.black),
                hintText: 'Enter DateOfBirth',
                labelText: 'DOB',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter DOB";
                }
              },
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Address";
                }
              },
            ),
            TextFormField(
              controller: patientContactController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone, color: Colors.black),
                hintText: 'Enter Contact Number',
                labelText: 'Contact Number',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                        .hasMatch(value)) {
                  return 'Please enter correct contact number';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: patientEmailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email, color: Colors.black),
                hintText: 'Enter Email ID',
                labelText: 'E-mail ID',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Email";
                } else if (!emailValid) {
                  return "Enter Valid Email";
                }
              },
            ),
            TextFormField(
              controller: patientAllergyController,
              decoration: const InputDecoration(
                icon: Icon(Icons.coronavirus, color: Colors.black),
                hintText: 'Enter Your Allergies',
                labelText: 'Allergies',
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Allergies. If don't have then enter 'No Allergies'.";
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(Icons.add_chart, color: Colors.black, size: 26),
                const SizedBox(width: 12),
                // DropdownButton(
                //   items: _status
                //       .map((value) => DropdownMenuItem(
                //             value: value,
                //             child: Text(
                //               value,
                //               style: const TextStyle(color: Colors.black),
                //             ),
                //           ))
                //       .toList(),
                //   onChanged: (selectedStatusType) {
                //     setState(() {
                //       selectedType = selectedStatusType;
                //     });
                //   },
                //   value: selectedType,
                //   isExpanded: false,
                //   hint: const Text(
                //     '-- Select Status --',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),

                DropdownButton(
                  value: selectedType,
                  onChanged: (String? value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                  items: _status.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),

                  hint: const Text(
                    '-- Select Status --',
                    style: TextStyle(color: Colors.black),
                  ),
                  // decoration: const InputDecoration(
                  //   labelText: 'Select an item',
                  // ),
                ),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Emergency Contact Person Name";
                }
              },
            ),
            TextFormField(
              controller: patientEmerContactController,
              decoration: const InputDecoration(
                icon: Icon(Icons.contact_emergency, color: Colors.black),
                hintText: 'Enter Emergency Contact Number',
                labelText: 'Emergency Contact Number',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Emergency Contact Number";
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: ElevatedButton(
                // onPressed: () {
                //   if (_formKeyValue.currentState!.validate()) {
                //     Map<String, String> patients = {
                //       'Patient_Name': patientNameController.text,
                //       'DOB': patientDobController.text,
                //       'Address': patientAddressController.text,
                //       'Contact_No': patientContactController.text,
                //       'EmailID': patientEmailController.text,
                //       'Allergies': patientAllergyController.text,
                //       'Status': patientStatusController.text,
                //       'Emergency_Name': patientEmerNameController.text,
                //       'Emergency_Contact': patientEmerContactController.text,
                //     };
                //     DatabaseReference.push().set(patients);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const ViewAllPatient()),
                //     );
                //   }
                // },

                onPressed: savedata,

                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const AddPatientRecord()),
                //   );
                // },

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
