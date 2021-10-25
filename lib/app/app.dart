import 'package:adote_patinhas/app/modules/profile/presentation/pages/firebase_test_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adote Patinhas",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: (settings) {},
      home: FirebaseTest(),
    );
  }
}
