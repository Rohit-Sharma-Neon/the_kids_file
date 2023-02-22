import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/app_colors.dart';

class NoRoute extends StatefulWidget {
  final String title;

  const NoRoute({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<NoRoute> createState() => _NoRouteState();
}

class _NoRouteState extends State<NoRoute> {
  PreferredSizeWidget appBar(String title) {
    return BaseAppBar(title: title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: appBar(widget.title),
      body: FadeInUp(
        child: Center(
          child: NeumorphicText('${widget.title} Screen',style: const NeumorphicStyle(depth: 8,color: Colors.black),),
        ),
      ),
    );
  }
}
