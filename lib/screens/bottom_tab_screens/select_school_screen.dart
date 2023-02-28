import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:school_project/api_services/api_models/school_list_model.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/providers/registeration_provider.dart';
import 'package:school_project/screens/register/register_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class SelectSchoolScreen extends StatefulWidget {
  const SelectSchoolScreen({Key? key}) : super(key: key);

  @override
  State<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen> {

  String selectedSchoolName = "";
  String selectedSchoolId = "";
  late RegistrationProvider registrationProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      registrationProvider = Provider.of<RegistrationProvider>(context,listen: false);
      registrationProvider.getSchoolList();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const BaseAppBar(title: "Select School",leading: SizedBox.shrink()),
      body: FadeInUp(
        child: Center(
          child: Consumer<RegistrationProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return value.isSchoolListLoading ? const CircularProgressIndicator() : Neumorphic(
                style: const NeumorphicStyle(depth: 8),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton<SchoolListData>(
                  isExpanded: true,
                  dropdownColor: AppColors.primaryColor,
                  alignment: Alignment.center,
                  underline: const SizedBox(),
                  hint: selectedSchoolName.isEmpty
                      ? const Text('Select School',style: TextStyle(color: Colors.black),)
                      : Text(
                    selectedSchoolName,
                  ),
                  onChanged: (val) {
                    selectedSchoolId = (val?.id??0).toString();
                    setState(
                          () {
                        selectedSchoolName = val?.name??"";
                      },
                    );
                  },
                  items: value.schoolListModel.result?.map((SchoolListData value) => DropdownMenuItem<SchoolListData>(
                    value: value,
                    child: Text(value.name??""),
                  )).toList(),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        isAnimate: true,
        margin: const EdgeInsets.only(bottom: 80,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
        onTap: (){
        if (selectedSchoolName.isNotEmpty) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: RegisterScreen(selectedSchoolId: selectedSchoolId,),
           );
        }else{
          Fluttertoast.cancel();
          Fluttertoast.showToast(msg: "Please Select School",gravity: ToastGravity.CENTER);
        }
       },
        title: 'Next',
      ),
    );
  }
}
