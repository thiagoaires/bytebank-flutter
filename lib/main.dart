import 'package:alura/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  // AppDatabase.save(ContactModel(0, 'Julieta', 2000)).then((id) {
  //   AppDatabase.findAll().then((contacts) => debugPrint(contacts.toString()));
  // });

  // AppDatabase.findAll().then(
  //   (contacts) {
  //     for (ContactModel contact in contacts) {
  //       debugPrint(contact.toString());
  //     }
  //   },
  // );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
