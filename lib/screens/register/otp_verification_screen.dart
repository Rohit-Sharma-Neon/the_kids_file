import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:school_project/common_widgets/custom_button.dart';
import 'package:school_project/screens/dashboard.dart';
import 'package:school_project/screens/home_screen/home_screen.dart';
import 'package:school_project/utils/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: NeumorphicAppBar(title: const Text("Verify Your Number",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),centerTitle: true,automaticallyImplyLeading: false,
          leading: NeumorphicBackButton(onPressed: (){Navigator.pop(context);},style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 10))),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 39.0,
        ),
        children: [
          // Container(
          //   width: _size.width,
          //   height: _size.height * 0.4,
          //   child: Image.asset(
          //     'assets/images/otpVerificationImg.png',
          //     // fit: BoxFit.cover,
          //   ),
          // ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            // width: 167.0,
            height: 24.0,
            margin: const EdgeInsets.symmetric(horizontal: 46.0),
            child: const Text(
              'Enter the 4-digit code',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 46.0),
            child: Row(
              children: [
                const Text(
                  'sent to +91- 8527866764',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                const SizedBox(
                  width: 11.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 46.0),
            width: 200,
            child: PinCodeTextField(
                keyboardType: TextInputType.phone,
                autoFocus: true,
                pinTheme: PinTheme(
                  inactiveColor: Colors.grey,
                  selectedColor: AppColors.primary,
                ),
                controller: _pinController,
                cursorColor: Colors.black,
                appContext: context,
                length: 4,
                onChanged: (pin) {}),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 46.0),
            child: const Text(
              'Auto detecting the code 00:25 seconds',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 46.0),
              child: const Text(
                'Resend Code',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
          CustomButton(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChildDetailScreen(),
                ),
              );*/
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: const Center(
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
