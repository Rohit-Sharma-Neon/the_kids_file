import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/utils/sizes.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Thank You"),
      body: Center(
        child: AnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Thanks for Joining Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,)),
              ],
            ),
            const Text("Venue: City Park, Mansarovar, Jaipur",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,)),
          ],
        ),
      ),
      bottomNavigationBar: PrimaryButton(onTap: (){
        Navigator.pop(context);
      },margin: const EdgeInsets.only(bottom: primaryButtonBottomMargin,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
          padding: const EdgeInsets.symmetric(vertical: 18), title: "Back"),
    );
  }
}
