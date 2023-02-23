import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/utils/helper_methods.dart';

import '../../common_widgets/text_widget.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text("Score",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: NeumorphicBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(), depth: 10),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Neumorphic(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                    ),
                    widthGap(10),
                    const Expanded(
                      child: CommonText(
                          text: 'John',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const CommonText(
                        text: '348.6',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
