import 'package:flutter/material.dart';
import 'package:krishak_sathi/Home_Page.dart';
import 'package:krishak_sathi/Labs/Confirm_adress.dart';
import 'package:krishak_sathi/lab.dart';
import 'package:krishak_sathi/login_page.dart';
import 'package:krishak_sathi/otp_page.dart';
import 'package:krishak_sathi/profile.dart';
import 'package:krishak_sathi/report/multiple_soil_reports.dart';
import 'package:krishak_sathi/router.dart';
import 'package:krishak_sathi/tracker/test_tracker.dart';
import 'crops/Crops.dart';
import 'report/report_analize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      onGenerateRoute: generateRoute,
    );
  }
}
