import 'package:flutter/material.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class AllLeave extends StatefulWidget {
  const AllLeave({super.key});

  @override
  State<AllLeave> createState() => _AllLeaveState();
}

class _AllLeaveState extends State<AllLeave> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
                backgroundColor: AppColors.leaveHover,
                label: Text(
                  "Leave",
                  style: TextStyle(color: AppColors.search),
                )),
            SizedBox(height: screenHeight * 0.02),
            _buildTaskForceItem('Half Day', 'Mon 01, Jan', 'Casual'),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskForceItem(String title, String date, String type) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$date\n$type'),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.green, // Green color for "Approved"
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Approved',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 8), // Space between the label and the image
            // Image on the right
            Image.asset(
              AppImages.arrow, // Replace with the path to your image
              width: 20, // Set the width of the image
              height: 20, // Set the height of the image
            ),
          ],
        ),
      ),
    );
  }
}
