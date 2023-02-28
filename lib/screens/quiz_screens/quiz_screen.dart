import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/screens/quiz_screens/question_answer_screen.dart';
import 'package:school_project/screens/quiz_screens/score_screen.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/helper_methods.dart';
import 'package:school_project/utils/sizes.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizModel> quizData = [
    QuizModel(
      name: 'Biology',
      image: AppImages.quizBiology,
      questions: '95',
    ),
    QuizModel(
      name: 'Calculator',
      image: AppImages.quizCalculator,
      questions: '95',
    ),
    QuizModel(
      name: 'Chemistry',
      image: AppImages.quizChemistry,
      questions: '95',
    ),
    QuizModel(
      name: 'Earth',
      image: AppImages.quizEarth,
      questions: '95',
    ),
    QuizModel(
      name: 'Biology',
      image: AppImages.quizBiology,
      questions: '95',
    ),
    QuizModel(
      name: 'Calculator',
      image: AppImages.quizCalculator,
      questions: '95',
    ),
    QuizModel(
      name: 'Chemistry',
      image: AppImages.quizChemistry,
      questions: '95',
    ),
    QuizModel(
      name: 'Earth',
      image: AppImages.quizEarth,
      questions: '95',
    ),
  ];

  Widget scoreWidget({String? value, String? title}) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
        ),
        widthGap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
                text: '$title', fontSize: 14, fontWeight: FontWeight.bold),
            CommonText(
              text: '$value',
              fontSize: 14,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: const EdgeInsets.only(left: scaffoldHorizontalPadding,right: scaffoldHorizontalPadding,top: 70),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CommonText(
                          text: 'Hi, John',
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      CommonText(
                        text: 'Let\'s make this day productive',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 24,
                  ),
                ],
              ),
              heightGap(20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScoreScreen(),
                    ),
                  );
                },
                child: Neumorphic(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            scoreWidget(title: 'Ranking', value: '348'),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.cyan,
                                thickness: 2,
                                width: 5,
                              ),
                            ),
                            scoreWidget(title: 'Points', value: '1209'),
                          ]),
                    ),
                  ),
                ),
              ),
              heightGap(20),
              const CommonText(
                  text: 'Let\'s Play',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ],
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: quizData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              padding: const EdgeInsets.only(top: 20,bottom: 80,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestonAnswerScreen(title: (quizData[index].name??"")),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.topStart,
                      fit: StackFit.loose,
                      children: [
                        Neumorphic(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CommonText(
                                    text: quizData[index].name ?? '',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                Text(quizData[index].questions ?? ''),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -35,
                          right: 20,
                          child: Image.asset(
                            quizData[index].image ?? '',
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuizModel {
  final String? image;
  final String? name;
  final String? questions;

  QuizModel({this.image, this.name, this.questions});
}
