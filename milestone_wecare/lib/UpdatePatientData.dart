import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdatePatient extends StatefulWidget {
  const UpdatePatient({super.key, required this.patientKey});

  final String patientKey;

  @override
  State<StatefulWidget> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
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

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('PatientData');
    getPatientData();
  }

  void getPatientData() async {
    DataSnapshot snapshot = await dbRef.child(widget.patientKey).get();

    Map patient = snapshot.value as Map;

    patientNameController.text = patient['Patient Name'];
    patientDobController.text = patient['DOB'];
    patientAddressController.text = patient['Address'];
    patientContactController.text = patient['Contact_No'];
    patientEmailController.text = patient['Email-ID'];
    patientAllergyController.text = patient['Allergies'];
    patientEmerNameController.text = patient['Emergency_Name'];
    patientEmerContactController.text = patient['Emergency_Contact'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updating Patient Data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                controller: patientNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.black),
                  hintText: 'Enter fullname',
                  labelText: 'PatientName',
                ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     const Icon(Icons.add_chart, color: Colors.black, size: 26),
              //     const SizedBox(width: 12),
              //     DropdownButton(
              //       value: selectedType,
              //     )
              //   ],
              // ),
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
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
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

                  dbRef
                      .child(widget.patientKey)
                      .update(patients)
                      .then((value) => {Navigator.pop(context)});
                },

                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ViewAllPatient()),
                //   );
                // },

                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
                child: const Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
