import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/utils/helper_methods.dart';
import 'package:school_project/utils/sizes.dart';

import '../../common_widgets/text_widget.dart';

class QuestonAnswerScreen extends StatefulWidget {
  final String title;
  const QuestonAnswerScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<QuestonAnswerScreen> createState() => _QuestonAnswerScreenState();
}

class _QuestonAnswerScreenState extends State<QuestonAnswerScreen> {
  int groupValue = -1;
  int pageViewBuilderIndex = 0;
  CountDownController countDownController = CountDownController();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.title),
      body: PageView.builder(
        controller: pageController,
        itemCount: data.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, pageViewIndex) {
          return SingleChildScrollView(
            child: Column(
              children: [
                heightGap(50),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Neumorphic(
                      margin: const EdgeInsets.symmetric(horizontal: scaffoldHorizontalPadding),
                      child: SizedBox(
                        height: deviceHeight(context) * 0.25,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 33),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CommonText(
                                      text: "Question ${pageViewIndex+1}/${data.length}",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: CommonText(
                                    text: data[pageViewIndex].question ?? '',
                                    fontSize: 18,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -32,
                      child: CircularCountDownTimer(
                        duration: 30,
                        initialDuration: 0,
                        controller: countDownController,
                        width: MediaQuery.of(context).size.height / 14,
                        height: MediaQuery.of(context).size.height / 14,
                        ringColor: NeumorphicColors.background,
                        ringGradient: null,
                        fillColor: Colors.purple,
                        fillGradient: null,
                        backgroundColor: Colors.grey.shade300,
                        backgroundGradient: null,
                        strokeWidth: 5,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        isReverse: true,
                        isReverseAnimation: true,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () {
                          print('Countdown Started');
                        },
                        onComplete: () {
                          print('Countdown Ended');
                          if (data.length != (pageViewIndex+1)) {
                            groupValue = -1;
                            setState(() {
                              pageViewBuilderIndex = pageViewBuilderIndex + 1;
                              pageController.jumpToPage(pageViewBuilderIndex);
                            });
                          }else{
                            countDownController.pause();
                          }
                        },
                        onChange: (String timeStamp) {
                          print('Countdown Changed $timeStamp');
                        },
                      ),
                    ),
                    const Align(alignment: Alignment.topLeft,child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 10),
                      child: Text("06",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600)),
                    )),
                    const Align(alignment: Alignment.topRight,child: Padding(
                      padding: EdgeInsets.only(right: 30,top: 10),
                      child: Text("04",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600)),
                    )),
                  ],
                ),
                heightGap(20),
                AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data[pageViewIndex].options?.length??0,
                    itemBuilder: (context, listViewIndex) {
                      return GestureDetector(
                        onTap: (){
                          print((data[pageViewIndex].isAnswered).toString());
                        },
                        child: AbsorbPointer(
                          absorbing: (data[pageViewIndex].isAnswered??false),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedListViewBuilder(
                                index: listViewIndex,
                                child: NeumorphicRadio(
                                  onChanged: (value){
                                    print("isAnswered -> "+(data[pageViewIndex].isAnswered??false).toString());
                                    print("Value -> "+(value.toString()));
                                    setState(() {
                                      groupValue = value as int;
                                      data[pageViewIndex].isAnswered = true;
                                    });
                                    countDownController.pause();
                                  },
                                  value: listViewIndex,
                                  groupValue: groupValue,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  style: NeumorphicRadioStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                    selectedColor: data[pageViewIndex].indexOfCorrectAnswer == listViewIndex ? Colors.green.shade300 : Colors.red.shade300,
                                    selectedDepth: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonText(
                                          text: data[pageViewIndex].options?[listViewIndex] ?? '',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                heightGap(20),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Next',
        margin: const EdgeInsets.only(bottom: 70,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
        onTap: () {
          groupValue = -1;
        setState(() {
          pageViewBuilderIndex = pageViewBuilderIndex + 1;
          pageController.jumpToPage(pageViewBuilderIndex);
        });

      },
      ),
    );
  }

  List<QuestionModel> data = [
    QuestionModel(
      id: 0,
      question: '1.Who was the first Indian in independent India to have won a medal in an individual Olympic event ?',
      answer: 'K D Jadhav',
      options: ['Dhyanchand', 'K D Jadhav', 'Prithipal Singh', 'Harishchandra Birajdar'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: 1,
      isAnswered: false,
    ),
    QuestionModel(
      id: 1,
      question:
      'Which among the following is the women’s equivalent of the Davis Cup?',
      answer: 'Fed Cup',
      options: ['Hopman Cup', 'Fed Cup', 'BMW Open', 'Millrose Cup'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: 1,
      isAnswered: false,
    ),
    QuestionModel(
      id: 2,
      question: 'The famous football player Maradona belongs to which among the following countries?',
      answer: 'Argentina',
      options: ['Brazil', 'Chile', 'Argentina', 'Italy'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: 2,
      isAnswered: false,
    ),
    QuestionModel(
      id: 3,
      question:
      'What is the tile of the autography of Major Dhyanchand?',
      answer: 'Goal',
      options: ['Goal', 'Hockey Days', 'Hockey – My Life', 'Me & My Hockey'],
      giveAnswerCorrect: null,
      indexOfCorrectAnswer: 0,
      isAnswered: false,
    ),
  ];
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
