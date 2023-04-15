// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:milestone_wecare/addPatientRecord.dart';

// void main() {
//   testWidgets('AddPatientRecord adds a new patient record',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: AddPatientRecord()));

//     final bpRateField =
//         find.widgetWithText(TextFormField, 'Bloodpressure Rate (mmHg)');
//     final oxyLevelField =
//         find.widgetWithText(TextFormField, 'Blood Oxygen Level (%)');
//     final respoRateField =
//         find.widgetWithText(TextFormField, 'Respiratory Rate (BPM)');
//     final heartRateField =
//         find.widgetWithText(TextFormField, 'Heartbeat Rate (BPM)');
//     final addButton = find.widgetWithText(ElevatedButton, 'Add Patient Record');

//     // Enter valid patient record data
//     await tester.enterText(bpRateField, '120');
//     await tester.enterText(oxyLevelField, '98');
//     await tester.enterText(respoRateField, '16');
//     await tester.enterText(heartRateField, '80');

//     // Tap on the add button
//     await tester.tap(addButton);
//     await tester.pumpAndSettle();

//     // Verify that the ViewAllPatientData screen is pushed
//     //expect(find.byType(ViewAllPatientData), findsOneWidget);
//   });
// }
