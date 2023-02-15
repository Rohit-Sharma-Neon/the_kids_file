import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/custom_button.dart';
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
    // var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
              itemCount: _onBoarding.length,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 40.0),
                        child: Image.asset(
                          _onBoarding[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          _onBoarding[index].title,
                          style: titleTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 260.0,
                        height: 40.0,
                        child: Text(_onBoarding[index].description,
                            textAlign: TextAlign.center,
                            style: descriptionTextStyle),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  _onBoarding.length,
                  (index) => AnimatedContainer(
                    padding: const EdgeInsets.all(2.0),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColors.primary
                            : Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      height: 54.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/countryFlag.png',
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text(
                              '+91',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            const Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Mobile Number',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF807E86),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpVerificationScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
