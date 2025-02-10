import 'package:flutter/material.dart';
import 'package:prayagedu/constants/bottomBar.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';
import 'package:prayagedu/screen/staff_leave/all_leave.dart';

class StaffLeaveAppbar extends StatefulWidget {
  const StaffLeaveAppbar({super.key});

  @override
  State<StaffLeaveAppbar> createState() => _StaffLeaveAppbarState();
}

class _StaffLeaveAppbarState extends State<StaffLeaveAppbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3, // Must match the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Staff Leave",
              style: TextStyle(color: AppColors.fontColors, fontSize: 20)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.08),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: _tabController.index == 0
                      ? AppColors.allColor
                      : _tabController.index == 1
                          ? AppColors.newLeaveColor
                          : AppColors.passRecordColor),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.header,
              unselectedLabelColor: AppColors.search,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_tabController.index == 0)
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.asset(AppImages.dot_green,
                              width: screenWidth * 0.02,
                              height: screenHeight * 0.02),
                        ),
                      const Text('All'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_tabController.index == 1)
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.asset(AppImages.dot_green,
                              width: screenWidth * 0.02,
                              height: screenHeight * 0.02),
                        ),
                      const Text('New leave'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_tabController.index == 2)
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.asset(
                            AppImages.dot_green,
                            width: screenWidth * 0.02,
                            height: screenHeight * 0.02,
                          ),
                        ),
                      // const SizedBox(width: 10),
                      const Text('Pass Records'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.header1,
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            AllLeave(),
            Icon(Icons.music_video),
            Icon(Icons.camera_alt),
          ],
        ),
        bottomNavigationBar: Bottombar(
          onTap: (int index) {},
        ),
      ),
    );
  }
}
