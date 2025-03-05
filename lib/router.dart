import 'package:flutter/material.dart';
import 'package:krishak_sathi/Labs/Confirm_adress.dart';
import 'package:krishak_sathi/adress_update/adress_page.dart';
import 'package:krishak_sathi/farmer_detail.dart';
import 'package:krishak_sathi/home_page.dart';
import 'package:krishak_sathi/login_page.dart';
import 'package:krishak_sathi/otp_page.dart';
import 'package:krishak_sathi/report/multiple_soil_reports.dart';
import 'package:krishak_sathi/report/report_analize.dart';
import 'package:krishak_sathi/sigup_page.dart';
import 'package:krishak_sathi/tracker/test_tracker.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case '/login':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const Login());
    case '/farmer_detail':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const FarmerDetailPage());
    case '/signup':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const SignUp());
    case '/homePage':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const HomePage());
    case '/otp':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const OtpPage());
    case '/confirm_address':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => BookingPage());
    case '/multiple-reports':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => SoilReportsPage());
    case '/report-analyze':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const SoilTestDetailsPage());
    case '/test-tracker':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const TestTracker());
    case '/adress-update':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => AddressPage());
    case '/farmer_details':
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => FarmerDetailPage());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Text("Error"),
              ));
  }
}
