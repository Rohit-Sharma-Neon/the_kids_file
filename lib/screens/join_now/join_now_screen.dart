import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/api_services/api_methods.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/screens/join_now/thank_you_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/dialogs.dart';
import 'package:school_project/utils/sizes.dart';

class JoinNowScreen extends StatefulWidget {
  const JoinNowScreen({Key? key}) : super(key: key);

  @override
  State<JoinNowScreen> createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const BaseAppBar(title: "Join Now"),
      body: AnimatedColumn(
        padding: const EdgeInsets.symmetric(horizontal: scaffoldHorizontalPadding),
        children: [
          Neumorphic(
            style: const NeumorphicStyle(depth: -8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 30,top: 50),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                ),
              ),
          ),
          Neumorphic(
            style: const NeumorphicStyle(depth: -8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 30),
            child: TextFormField(
              controller: schoolController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "School",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
              ),

            ),
          ),
          Neumorphic(
            style: const NeumorphicStyle(depth: -8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 30),
            child: TextFormField(
              controller: classController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Class",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
              ),
            ),
          ),
          Neumorphic(
            style: const NeumorphicStyle(depth: -8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 30),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
              ),
            ),
          ),
          Neumorphic(
            style: const NeumorphicStyle(depth: -8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 30),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Phone",
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: PrimaryButton(onTap: ()async{
        ScaffoldMessenger.of(context).clearSnackBars();
        FocusScope.of(context).unfocus();
        if (nameController.text.length < 3) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Name should not be less than 3 character')));
        }else if(schoolController.text.length < 3){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('School Name should not be less than 3 character')));
        }else if(classController.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Class should not be empty')));
        }else if(emailController.text.length < 3){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email should not be less than 3 character')));
        }else if(phoneController.text.length < 9){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phone should not be less than 10 character')));
        }else{
          Dialogs().showLoader(context: context);
          ApiMethods().joinNowApi(name: nameController.text.trim(),schoolName: schoolController.text.trim(),className: classController.text.trim(),email: emailController.text.trim(),mobileNo: phoneController.text.trim()).then((value){
            Navigator.of(context, rootNavigator: true).pop(true);
            if(value.success??false){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ThankYouScreen()));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.msg??"")));
            }
          });
        }

      },margin: const EdgeInsets.only(bottom: 70,right: 20,left: 20),
          padding: const EdgeInsets.symmetric(vertical: 18), title: "Join Now"),
    );
  }
}
