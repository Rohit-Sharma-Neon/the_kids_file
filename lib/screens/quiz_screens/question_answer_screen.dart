import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/utils/helper_methods.dart';

import '../../common_widgets/text_widget.dart';

class QuestonAnswerScreen extends StatefulWidget {
  const QuestonAnswerScreen({Key? key}) : super(key: key);

  @override
  State<QuestonAnswerScreen> createState() => _QuestonAnswerScreenState();
}

class _QuestonAnswerScreenState extends State<QuestonAnswerScreen> {
  List<QuestionModel> data = [
    QuestionModel(
      id: 0,
      question: 'What is the most popular sport through out the world?',
      answer: 'Cricket',
      options: ['Volleyball', 'Football', 'Basketball', 'Cricket'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: null,
      isAnswered: false,
    ),
    QuestionModel(
      id: 0,
      question:
          'What is one of the big differences between traditional media and social media?',
      answer: 'Volleyball',
      options: ['Volleyball', 'Football', 'Basketball', 'Cricket'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: null,
      isAnswered: false,
    ),
    QuestionModel(
      id: 0,
      question:
          'Which of the following is NOT a fundamental area of change regarding people\'s media habits?',
      answer: 'Football',
      options: ['Volleyball', 'Football', 'Basketball', 'Cricket'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: null,
      isAnswered: false,
    ),
  ];
  int pageViewBuilderIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text("Questions",
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
        child: PageView.builder(
          controller: pageController,
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final questionData = data[index];
            return SingleChildScrollView(
              child: Column(
                children: [
                  heightGap(50),
                  Neumorphic(
                    child: SizedBox(
                      height: deviceHeight(context) * 0.25,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 30.0),
                        child: CommonText(
                            text: questionData.question ?? '',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  heightGap(20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questionData.options?.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(5)),
                                border: NeumorphicBorder(
                                    width: 1, color: Colors.grey),
                                depth: 0,
                                lightSource: LightSource.topRight,
                              ),
                              child: SizedBox(
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5),
                                  child: Row(children: [
                                    Expanded(
                                      child: CommonText(
                                          text: questionData.options?[i] ?? '',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    NeumorphicIcon(
                                      Icons.highlight_remove_outlined,
                                      style: const NeumorphicStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            heightGap(10),
                          ],
                        ),
                      );
                    },
                  ),
                  heightGap(20),
                  SizedBox(
                    width: deviceWidth(context) * 0.50,
                    child: NeumorphicButton(
                      onPressed: () {
                        setState(() {
                          pageViewBuilderIndex = pageViewBuilderIndex + 1;
                          pageController.jumpToPage(pageViewBuilderIndex);
                        });
                      },
                      child: const Center(
                        child: CommonText(
                            text: 'Next',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuestionModel {
  final int? id;
  final String? question;
  final String? answer;
  final List<String>? options;
  bool? giveAnswerCorrect;
  bool? isAnswered;
  int? indexOfCorrectAnswer;

  QuestionModel({
    this.id,
    this.question,
    this.answer,
    this.options,
    this.isAnswered,
    this.giveAnswerCorrect,
    this.indexOfCorrectAnswer,
  });
}
