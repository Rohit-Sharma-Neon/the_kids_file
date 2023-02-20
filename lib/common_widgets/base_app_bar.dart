import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget{
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const BaseAppBar({
    super.key,
    this.title = "",
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: NeumorphicAppBar(
        actions: actions,
        automaticallyImplyLeading: false,
        leading: SizedBox(height: double.infinity,child: leading??NeumorphicBackButton(onPressed: (){Navigator.pop(context);},style: NeumorphicStyle(boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),depth: 10))),
        color: AppColors.primaryColor,
        title: Text(
          title??"",
            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(baseAppBarHeight);
}