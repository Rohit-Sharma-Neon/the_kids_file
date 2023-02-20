import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/common_widgets/text_style.dart';
import 'package:school_project/screens/register/otp_verification_screen.dart';
import 'package:school_project/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _controller = PageController();
  final TextEditingController mobileController = TextEditingController();
  final List<OnBoarding> _onBoarding = [
    const OnBoarding(
        imageUrl: 'assets/images/paymentInformation.png',
        title: 'Make Payment',
        description:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as"),
    const OnBoarding(
        imageUrl: 'assets/images/subscriber.png',
        title: 'Get Notification',
        description:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as"),
    const OnBoarding(
        imageUrl: 'assets/images/paymentInformation.png',
        title: 'Make Payment',
        description:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as"),
  ];

  int currentIndex = 0;

  // Widget indicator(){
  //   return
  // }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const BaseAppBar(title: "Enter Your Mobile"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: List.generate(
          //     _onBoarding.length,
          //         (index) => AnimatedContainer(
          //       padding: const EdgeInsets.all(2.0),
          //       duration: const Duration(milliseconds: 300),
          //       child: Container(
          //         height: 5.0,
          //         width: 5.0,
          //         decoration: BoxDecoration(
          //           color: currentIndex == index
          //               ? AppColors.primary
          //               : Colors.grey.shade700,
          //           borderRadius: BorderRadius.circular(3.0),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 60),
          Container(
            margin: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // SizedBox(
                //   child: Text(
                //     _onBoarding[0].title,
                //     style: titleTextStyle,
                //   ),
                // ),
                // const SizedBox(height: 15),
                // SizedBox(
                //   child: Text(
                //     _onBoarding[0].description,
                //     style: descriptionTextStyle,
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                const SizedBox(height: 60),
                Neumorphic(
                  style: const NeumorphicStyle(depth: -8),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    autofocus: true,
                    controller: mobileController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counter: const SizedBox.shrink(),
                      counterText: "",
                      counterStyle: const TextStyle(fontSize: 0),
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/countryFlag.png',
                            fit: BoxFit.fill,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '+91',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      hintText: 'Enter Mobile Number',
                      hintStyle: const TextStyle(
                        color: Color(0xFF807E86),
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  isAnimate: true,
                  margin: const EdgeInsets.only(top: 60),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerificationScreen(mobileNumber: mobileController.text.trim()),
                      ),
                    );
                  },
                  title: 'Next',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}

class OnBoarding {
  final String imageUrl;
  final String title;
  final String description;

  const OnBoarding({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
