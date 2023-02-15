import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Center(child: NeumorphicText("Coming Soon",style: NeumorphicStyle(color: Colors.black,depth: 10,intensity: 1.0),
       textStyle: NeumorphicTextStyle(fontSize: 30,fontWeight: FontWeight.bold),
      ),
    );
  }
}
