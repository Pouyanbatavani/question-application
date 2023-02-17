
import 'package:applicationquestion/screen/result_screen.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/question_model.dart';
import '../widgets/answer_container.dart';
import '../widgets/base_widget.dart';
import '../widgets/progress_bar.dart';
import '../widgets/question_listrow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
// With  TickerProviderStateMixin used For animation
  late AnimationController controller;
  late Animation animation;
  late Size size;
  ScrollController scrollController = ScrollController();

  bool isOnePressed = true;
  int currentQuestionNumber = 0;
  List statusList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < questionList.length; i++) {
      statusList.add(0);
    }
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 20)); //learning for Now.
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() >= 98) {
            onNextPressed(true);
            if (controller.isAnimating) {
              controller.reset();
              controller.forward();
            }
          }
        });
      });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      children: [
        const SizedBox(
          height: 80.0,
        ),
        // Container(
        //   height: 20.00,
        //   decoration: BoxDecoration(
        //       color: kLightBlueColor,
        //       borderRadius: BorderRadius.circular(10.0)),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(10.0),
        //     child: LinearProgressIndicator(
        //       value: animation.value,
        //       backgroundColor: kLightBlueColor,
        //       valueColor: const AlwaysStoppedAnimation(Colors.white),
        //     ),
        //   ),
        // ), //CLEAN CODE:ProgressBar
        ProgressBar(animation: animation),
        const SizedBox(
          height: 20.0,
        ),
        QuestionListRow(
            currentQuestionNumber: currentQuestionNumber,
            statusList: statusList,
            scrollController: scrollController),
        SizedBox(
          height: 480,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width - 150,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: size.width - 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(35)),
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.lightBlueAccent,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 70)
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 155.0,
                      ),
                      SizedBox(
                        height: 80,
                        child: Text(
                          questionList[currentQuestionNumber].question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnswerContainer(
                            answer: questionList[currentQuestionNumber].answer,
                            num: 1,
                            isOnePressed: isOnePressed,
                            onTapped: () {
                              onAnswerPressed(1);
                            },
                          ),
                          AnswerContainer(
                            answer: questionList[currentQuestionNumber].answer2,
                            num: 2,
                            isOnePressed: isOnePressed,
                            onTapped: () {
                              onAnswerPressed(2);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: kNextButtonColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                onTap: () {
                  onNextPressed(false);
                },
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: kPurpleColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                onTap: () {
                  myNavigator();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: const Center(
                    child: Icon(
                      Icons.flag,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  myNavigator() {
    controller.reset();
    controller.dispose();
    List<int> resultList = grader();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            resultList: resultList,
          ),
        ));
  }

  // Widget questionListRow() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < questionList.length; i++) {
  //     list.add(questionNumber(i + 1));
  //   }
  //   return SingleChildScrollView(
  //     controller: scrollController,
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: list,
  //     ),
  //   );
  // } //ویجت های کامنت شده در فایل ویجت تعریف شدن{CLEAN CODE}

  // Widget questionNumber(int num) {
  //   Color color = kLightBlueColor;
  //   int temp = num - 1;
  //   int size = questionList.length;
  //   if (temp == currentQuestionNumber) {
  //     if (temp == size - 1 && statusList[temp] != 0) {
  //       if (statusList[temp] == true) {
  //         color = kLightGreenColor;
  //       } else if (statusList[temp] == false) {
  //         color = kLightRedColor;
  //       } else {}
  //     } else {
  //       color = Colors.white;
  //     }
  //   } else {
  //     if (statusList[temp] == true) {
  //       color = kLightGreenColor;
  //     } else if (statusList[temp] == false) {
  //       color = kLightRedColor;
  //     } else {}
  //   }
  //   return Container(
  //     height: temp == currentQuestionNumber ? 80.0 : 60.00,
  //     width: temp == currentQuestionNumber ? 80.0 : 60.00,
  //     margin: const EdgeInsets.symmetric(horizontal: 10.0),
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: color,
  //     ),
  //     child: Center(
  //         child: Text(
  //       '$num',
  //       style: TextStyle(
  //           color: temp == currentQuestionNumber ? Colors.blue : Colors.white,
  //           fontSize: temp == currentQuestionNumber ? 40 : 30,
  //           fontWeight: FontWeight.bold),
  //     )),
  //   );
  // } //CLEAN CODE

  void onNextPressed(bool isFromTimer) {
    scrollController.animateTo(currentQuestionNumber * 70,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    if (isFromTimer) {
      statusList[currentQuestionNumber] = false;
    } else {
      checkAnswer();
    }

    if (currentQuestionNumber >= 9) {
      myNavigator();

      //pass
    } else {
      currentQuestionNumber++;
      setState(() {});
    }
  }

  onAnswerPressed(int num) {
    if (num == 1) {
      setState(() {
        isOnePressed = true;
      });
    } else {
      setState(() {
        isOnePressed = false;
      });
    }
  }

  // Widget answerContainer(String answer, int num) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (num == 1) {
  //         setState(() {
  //           isOnePressed = true;
  //         });
  //       } else {
  //         setState(() {
  //           isOnePressed = false;
  //         });
  //       }
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  //       decoration:
  //       BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
  //         BoxShadow(
  //           color: isOnePressed && num == 1 || !isOnePressed && num == 2
  //               ? const Color(0xff84a2ff)
  //               : const Color(0xff8fdcff),
  //           offset: const Offset(-4, -4),
  //         ),
  //         BoxShadow(
  //           color: isOnePressed && num == 1 || !isOnePressed && num == 2
  //               ? kPurpleColor
  //               : kLightBlueColor,
  //         )
  //       ]),
  //       child: Text(
  //         answer,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 20,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  checkAnswer() {
    int myAnswer = isOnePressed ? 1 : 2;
    bool status = (questionList[currentQuestionNumber].isRight(myAnswer));
    statusList[currentQuestionNumber] = status;
  }

  List<int> grader() {
    int rightAnswer = 0;
    int wrongAnswer = 0;
    int whiteAnswer = 0;
    for (var item in statusList) {
      if (item == true) {
        rightAnswer++;
      } else if (item == false) {
        wrongAnswer++;
      } else {
        whiteAnswer++;
      }
    }
    return [rightAnswer, wrongAnswer, whiteAnswer];
  }
}