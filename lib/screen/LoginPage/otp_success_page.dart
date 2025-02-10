import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class OtpSuccessPage extends StatefulWidget {
  const OtpSuccessPage({super.key});

  @override
  State<OtpSuccessPage> createState() => _OtpSuccessPageState();
}

class _OtpSuccessPageState extends State<OtpSuccessPage>
    with TickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.header,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.15),
          AnimatedPositioned(
            // left: _gifPositionX * screenWidth,
            left: 0,
            top: screenHeight * 0.3,
            duration: Duration(seconds: 3),
            child: GestureDetector(
              onTap: () {
                // _moveGif();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth *
                    0.3), // Use half of the width/height to make it round
                child: Gif(
                  image: AssetImage(AppImages.success2),
                  controller: _controller,
                  autostart: Autostart.once,
                  onFetchCompleted: () {
                    _controller.reset();
                    _controller.forward();
                  },
                  width: screenWidth *
                      0.4, // Equal width and height to make it a circle
                  height: screenWidth * 0.4, // Keep the height same as width
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Successful",
                  style: TextStyle(color: AppColors.search, fontSize: 16),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                Image.asset(
                  AppImages.checkmark,
                  width: 25,
                  height: 30,
                )
              ],
            ),
          ),
          Center(
            child: Text("Your OTP has received Successfully"),
          ),
          SizedBox(
            height: screenHeight * 0.5,
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.10,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Verify",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Image.asset(
                      AppImages.add_icon,
                      width: 25,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
