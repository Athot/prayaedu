import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:prayagedu/constants/colors.dart';
import 'package:prayagedu/constants/icons.dart';

class AddSchool extends StatefulWidget {
  const AddSchool({super.key});

  @override
  State<AddSchool> createState() => _AddSchoolState();
}

class _AddSchoolState extends State<AddSchool> with TickerProviderStateMixin {
  late GifController _controller;
  bool _isLoading = false;

  // double _gifPositionX = 0;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);

    // _moveGif();
  }

  // void _moveGif() {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     setState(() {
  //       _gifPositionX = 0.5;
  //     });
  //     _controller.reset();
  //     _controller.forward();
  //   });
  // }

  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();

  void _showAddSchoolOverlay(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double logoWidth = screenHeight * 0.15;
    double logoHeight = screenWidth * 0.15;
    double containerWidth = screenWidth * 0.40;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 1,
            child: Material(
              color: _isLoading ? Colors.black : AppColors.hover,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: _isLoading
                    ? Center(
                        child: Gif(
                          image: const AssetImage(AppImages.black_loading),
                          controller: _controller,
                          autostart: Autostart.loop,
                          onFetchCompleted: () {
                            // _controller.reset();
                            _controller.forward();
                          },
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //
                          SizedBox(height: screenHeight * 0.05),
                          Center(
                            child: Container(
                              width: containerWidth,
                              height: screenHeight * 0.10,
                              decoration: const BoxDecoration(
                                color: AppColors.bottomBar,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.otp_icon,
                                  width: logoWidth,
                                  height: logoHeight,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.10),
                          const Center(
                            child: Text(
                              'Enter the OTP',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColors.search,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Center(
                            child: Text(
                              'The OTP will be sent to the principal to get access',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          Center(
                            child: SizedBox(
                              width: screenWidth * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildOtpTextField(otp1),
                                  _buildOtpTextField(otp2),
                                  _buildOtpTextField(otp3),
                                  _buildOtpTextField(otp4),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.header,
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
                                    "Send",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  Image.asset(
                                    AppImages.enter2,
                                    width: 25,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                _showAddSchoolOverlay(context);
                                _isLoading = true;
                                // Reopens the overlay to resend OTP
                              },
                              child: Text(
                                "Don't receive OTP? Resend OTP",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors
                                      .header, // Change to match your theme
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInCubic)),
          child: child,
        );
      },
    );
  }

  Widget _buildOtpTextField(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
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
                  image: AssetImage(AppImages.school_gif),
                  controller: _controller,
                  autostart: Autostart.loop,
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
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _showAddSchoolOverlay(context);
                },
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
                      "Add School",
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
