import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone_wecare/addPatientData.dart';

void main() {
  testWidgets('Add Patient Data Integration Test', (WidgetTester tester) async {
    tester.widget(const AddPatientData() as Finder);

    await tester.enterText(
        find.byKey(const Key('PatientName')), 'Apeksha Parmar');
    await tester.enterText(find.byKey(const Key('DOB')), '08.07.1999');
    await tester.enterText(
        find.byKey(const Key('Address')), '123 Centennial College');
    await tester.enterText(
        find.byKey(const Key('ContactNo')), '+1-234-567-890');
    await tester.enterText(find.byKey(const Key('EmailID')), 'ap@gmail.com');
    await tester.enterText(find.byKey(const Key('Allergies')), 'No Allergies');
    await tester.enterText(find.byKey(const Key('Status')), 'Normal');
    await tester.enterText(
        find.byKey(const Key('Emergency Contact Name')), 'Harsh Parikh');
    await tester.enterText(
        find.byKey(const Key('Emergency Contact Number')), '+1-098-765-432');

    await tester.tap(find.byKey(const Key('Add Patient Data')));
    await tester.pump();

    expect(find.text('Thank you for submitting your application!'),
        findsOneWidget);
  });
}
