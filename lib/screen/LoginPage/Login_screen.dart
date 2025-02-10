import 'package:flutter/material.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust values based on screen size
    double containerWidth = screenWidth * 0.4; // 40% of screen width
    double containerHeight = screenHeight * 0.25; // 25% of screen height
    double logoWidth = screenWidth * 0.3; // 30% of screen width
    double logoHeight = screenHeight * 0.15; // 15% of screen height
    double textSize = screenWidth * 0.08; // Text size relative to screen width
    double buttonWidth =
        screenWidth * 0.6; // Button width relative to screen width

    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.header,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                    color: AppColors.grey, shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    AppImages.login_logo,
                    width: logoWidth,
                    height: logoHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1), // 10% of screen height
              Text(
                "Welcome Back",
                style: TextStyle(color: Colors.white, fontSize: textSize),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.hover,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: screenWidth * 0.05, color: AppColors.search),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
