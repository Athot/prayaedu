import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:prayagedu/constants/bottomBar.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(color: AppColors.fontColors, fontSize: 30),
        ),
        backgroundColor: AppColors.header1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                // Handle profile icon tap (e.g., navigate to profile page)
                // print("Profile icon tapped");
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    AppImages.profile), // Replace with your asset image path
                radius: 30,
              ),
            ),
          ),
        ],
        toolbarHeight: screenHeight * 0.15,
      ),
      body: Center(
        // padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          children: [
            _buildDashboardItem(AppImages.home, screenWidth, screenHeight),
            _buildDashboardItem(AppImages.calender, screenWidth, screenHeight),
            _buildDashboardItem(AppImages.grievance, screenWidth, screenHeight),
            _buildDashboardItem(
                AppImages.staff_leave, screenWidth, screenHeight),
            _buildDashboardItem(AppImages.notice, screenWidth, screenHeight),
            _buildDashboardItem(AppImages.fees, screenWidth, screenHeight),
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(
        onTap: (int index) {},
      ),
    );
  }

  Widget _buildDashboardItem(
      String imagePath, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.15,
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.grey[200], // Light background color for better UI
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: screenWidth * 0.16,
          height: screenHeight * 0.1,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
