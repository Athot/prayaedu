import 'package:flutter/material.dart';
import 'package:prayagedu/screen/staff_leave/all_leave.dart';
import 'package:prayagedu/screen/staff_leave/staff_leave_appbar.dart';
import 'package:prayagedu/screen/LoginPage/Login_screen.dart';
import 'package:prayagedu/screen/LoginPage/add_school.dart';
import 'package:prayagedu/screen/LoginPage/otp_success_page.dart';
import 'package:prayagedu/screen/LoginPage/sign_in.dart';
import 'package:prayagedu/screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StaffLeaveAppbar(),
    );
  }
}
