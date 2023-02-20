import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/screens/register/register_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class SelectSchoolScreen extends StatefulWidget {
  const SelectSchoolScreen({Key? key}) : super(key: key);

  @override
  State<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen> {
  String _dropDownValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: NeumorphicAppBar(title: const Text("Select School",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),centerTitle: true,automaticallyImplyLeading: false,),
      body: Center(
        child: Neumorphic(
          style: const NeumorphicStyle(depth: 8),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: AppColors.primaryColor,
            alignment: Alignment.center,
            underline: const SizedBox(),
            hint: _dropDownValue.isEmpty
                ? const Text('Select School',style: TextStyle(color: Colors.black),)
                : Text(
              _dropDownValue,
            ),
            onChanged: (val) {
              setState(
                    () {
                  _dropDownValue = val.toString();
                },
              );
            },
            items: ['Banyan Tree', 'The Asian School', 'St. Xavier’s Collegiate School',"Delhi Public School","Bombay Scottish School"].map(
                  (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        isAnimate: true,
        margin: const EdgeInsets.only(bottom: 80,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
        onTap: (){
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const RegisterScreen(),
         );
       },
        title: 'Next',
      ),
    );
  }
}
