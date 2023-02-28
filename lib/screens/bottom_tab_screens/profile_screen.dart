import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/main.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/dialogs.dart';
import 'package:school_project/utils/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: BaseAppBar(
        title: "Profile",
        leading: SizedBox(height: double.infinity,child: NeumorphicButton(onPressed: (){},style: NeumorphicStyle(boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),depth: 10),child: const Icon(Icons.edit,color: Colors.black))),
        actions: [SizedBox(height: double.infinity,child: NeumorphicButton(onPressed: (){},style: NeumorphicStyle(boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),depth: 10),child: const Icon(Icons.settings,color: Colors.black)))]),
      body: AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Neumorphic(
              margin: const EdgeInsets.only(top: 10,bottom: 20),
              style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 9),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 6,color: NeumorphicColors.background
                  ),
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage("https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                ),
              ),
            ),
          ],
        ),
            const Text("Rohit Sharma",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
            const SizedBox(height: 6),
            Text("rohitsharma@gmail.com",style: TextStyle(fontSize: 16,color: Colors.grey.shade900)),
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeumorphicButton(
            onPressed: (){
              Dialogs().logOutDialog(context: context);
            },
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.only(left: scaffoldHorizontalPadding,right: scaffoldHorizontalPadding,bottom: 20),
            style: NeumorphicStyle(color: Colors.red.shade400,depth: 8),child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Sign Out",
                    textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),
                ),
              ],
            ),
          ),
          Text("V 1.0.0",style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
