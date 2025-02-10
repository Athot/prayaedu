import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class Bottombar extends StatefulWidget {
  final Function(int) onTap;
  const Bottombar({super.key, required this.onTap});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        backgroundColor: AppColors.header1,
        items: [
          TabItem(icon: Image.asset(AppImages.home), title: 'Home'),
          TabItem(icon: Image.asset(AppImages.fees), title: 'Fees'),
          TabItem(icon: Image.asset(AppImages.calender), title: 'Calender'),
          TabItem(icon: Image.asset(AppImages.notice), title: 'Notice'),
        ],
        onTap: widget.onTap);
  }
}
