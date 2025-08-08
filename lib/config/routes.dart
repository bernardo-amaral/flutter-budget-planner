import 'package:flutter/material.dart';
import 'package:login_app/home.dart';
import 'package:login_app/login.dart';

class Routes {
  static const String home = HomePage.routeName;
  static const String login = LoginPage.routeName;
  // static const String patientCreate = PatientCreatePage.routeName;

  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      HomePage.routeName: (_) => HomePage(),
      LoginPage.routeName: (_) => LoginPage(),
      // PatientsSchedulePage.routeName: (_) => PatientsSchedulePage(),
      // PatientCreatePage.routeName: (_) => PatientCreatePage(),
      // CreateAppointmentPage.routeName: (_) => CreateAppointmentPage(),
    };
  }
}
