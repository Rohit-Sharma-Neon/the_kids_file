import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/screens/dashboard.dart';
import 'package:school_project/utils/app_colors.dart';

class ChildDetailScreen extends StatefulWidget {
  const ChildDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChildDetailScreen> createState() => _ChildDetailScreenState();
}

class _ChildDetailScreenState extends State<ChildDetailScreen> {
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  double size = 3.0;

  @override
  void dispose() {
    firstNamecontroller.dispose();
    lastNamecontroller.dispose();
    super.dispose();
  }

  Widget titleText(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 39.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        title: const Text(
          'Child Detail',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 17.0),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
            child: const Text(
              'Please Enter child Detail',
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          titleText('First Name'),
          SizedBox(
            height: size,
          ),
          SimpleTextField(
              controller: firstNamecontroller, hintText: 'First Name'),
          const SizedBox(
            height: 13.0,
          ),
          titleText('Last Name'),
          SizedBox(
            height: size,
          ),
          SimpleTextField(
              controller: lastNamecontroller, hintText: 'Last Name'),
          const SizedBox(
            height: 13.0,
          ),
          titleText('Photo'),
          SizedBox(
            height: size,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 17.0),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/imageMask.png'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 200.0,
                      child: const TextField(
                        enabled: false,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Photo',
                          hintStyle: TextStyle(
                            color: Color(0xFF807E86),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/cameraImage.png',
                      width: 23.79,
                      height: 19.66,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/images/galleryImage.png',
                      width: 23.79,
                      height: 19.66,
                    ),
                    const SizedBox(
                      width: 13.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 13.0,
          ),
          titleText('Class'),
          SizedBox(
            height: size,
          ),
          const CustomDropDown(hintTitle: 'Select Class'),
          const SizedBox(
            height: 13.0,
          ),
          titleText('Section'),
          SizedBox(
            height: size,
          ),
          const CustomDropDown(hintTitle: 'Select Section'),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 39.0),
            child: PrimaryButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoardScreen(),
                  ),
                );
              },
              title: 'Confirm',
            ),
          )
        ],
      ),
    );
  }
}

class SimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SimpleTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 2.0, color: Colors.grey),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            //isDense: true,
            //contentPadding: const EdgeInsets.all(18.0),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF807E86),
              fontSize: 14.0,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String hintTitle;

  const CustomDropDown({
    Key? key,
    required this.hintTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 2.0, color: Colors.grey),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Text(
            hintTitle,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF807E86),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_down,
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}

/*
Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: DropdownButton(
          items: [],
          onChanged: (value) {},
          hint: Text(
            hintTitle,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF807E86),
            ),
          ),
        ),
      ),
 */
