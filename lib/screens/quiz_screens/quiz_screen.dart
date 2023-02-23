import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/screens/quiz_screens/question_answer_screen.dart';
import 'package:school_project/screens/quiz_screens/score_screen.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/helper_methods.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizModel> quizData = [
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
      questions: '95',
    ),
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
      questions: '95',
    ),
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
      questions: '95',
    ),
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
      questions: '95',
    ),
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
      questions: '95',
    ),
    QuizModel(
      name: 'Sports',
      image: AppImages.football,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: quizData.length,
                    (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestonAnswerScreen(),
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
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 16.0),
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
                            ),
                            Positioned(
                              top: -35,
                              left: 0,
                              child: Image.asset(
                                quizData[index].image ?? '',
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
