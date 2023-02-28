import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:school_project/api_services/api_methods.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/main.dart';
import 'package:school_project/providers/dashboard_provider.dart';
import 'package:school_project/screens/home_screen/home_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/app_string.dart';
import 'package:school_project/utils/dialogs.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String mobileNumber;
  const OtpVerificationScreen({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _pinController = TextEditingController();

  Timer? _timer;
  int _start = 60;
  late DashBoardProvider dashBoardProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
        startTimer();
        dashBoardProvider = Provider.of<DashBoardProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _timer?.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const BaseAppBar(title: "Verify Your Number"),
      body: AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 39.0,
        ),
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
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
                Text(
                  'sent to +91- ${widget.mobileNumber}',
                  style: const TextStyle(
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
                      color: AppColors.primaryColor,
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
                autoDisposeControllers: false,
                pinTheme: PinTheme(
                  inactiveColor: Colors.grey,
                  selectedColor: AppColors.primaryColor,
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
            child: Text(
              'Auto detecting the code 00:${_start.toString()} seconds',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              if (_start == 0) {
                _timer?.cancel();
                _start = 60;
                startTimer();
                Dialogs().showLoader(context: context);
                ApiMethods().sendOtp(type: "login",mobileNo: widget.mobileNumber.trim()).then((value){
                  Navigator.of(context, rootNavigator: true).pop(true);
                  if(value.success??false){
                    Fluttertoast.showToast(msg: value.msg??"");
                  }else{
                    Fluttertoast.showToast(msg: value.msg??"");
                  }
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 46.0),
              child: Text(
                'Resend Code',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700,color: _start == 0 ? Colors.black : Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
          PrimaryButton(
            isAnimate: true,
            onTap: () {
              if (_pinController.text.trim().length < 4) {
                Fluttertoast.showToast(msg: "Please enter valid OTP!",gravity: ToastGravity.CENTER);
              }else{
                Dialogs().showLoader(context: context);
                ApiMethods().veryOTP(type: "login",mobileNo: widget.mobileNumber,otp: _pinController.text.trim()).then((value) async {
                  Navigator.of(context, rootNavigator: true).pop(true);
                  if(value.success??false){
                    await spPreferences?.setBool(spKeys().isLoggedIn,value.success??false);
                    dashBoardProvider.updateLoggedInStatus(loggedIn: value.success??false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }else{
                    Fluttertoast.showToast(msg: value.msg??"");
                  }
                });
              }
            },
            title: 'Confirm',
          )
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (_start == 0) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        }));
  }
}
