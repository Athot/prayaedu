import 'package:flutter/material.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjusted values for better responsiveness
    double logoWidth = screenHeight * 0.30;
    double logoHeight = screenWidth * 0.30;
    double containerWidth = screenWidth * 0.45; // 40% of screen width

    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: [
            Container(
              color: AppColors.header,
              child: Center(
                child: Container(
                  width: containerWidth,
                  height: screenHeight * 0.40,
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
              ),
            ),
            // Bottom section with inputs
            Container(
              width: screenWidth,
              height: screenHeight *
                  0.60, // Adjusted to take up the rest of the space
              color: AppColors.hover,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight *
                          0.05), // Add top padding to push content up
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Align the children to the top
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons
                                  .email, // Use a built-in icon like 'lock' for password
                              size: 20, // Adjust the size here
                              color: Colors.black, // Set the color of the icon
                            ),
                            labelText: ' Email',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: AppColors.search,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: AppColors.search,
                              prefixIcon: Icon(
                                Icons
                                    .lock, // Use a built-in icon like 'lock' for password
                                size: 20, // Adjust the size here
                                color:
                                    Colors.black, // Set the color of the icon
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                      SizedBox(height: screenHeight * 0.02),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bottomBar,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.10, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: AppColors.search,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
