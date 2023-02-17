import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/question_model.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({Key? key, required this.num, required this.currentQuestionNumber, required this.statusList}) : super(key: key);
  final int num;
  final int currentQuestionNumber;
  final List statusList;

  @override
  Widget build(BuildContext context) {
    Color color = kLightBlueColor;
    int temp = num - 1;
    int size = questionList.length;
    if (temp == currentQuestionNumber) {
      if (temp == size - 1 && statusList[temp] != 0) {
        if (statusList[temp] == true) {
          color = kLightGreenColor;
        } else if (statusList[temp] == false) {
          color = kLightRedColor;
        } else {}
      } else {
        color = Colors.white;
      }
    } else {
      if (statusList[temp] == true) {
        color = kLightGreenColor;
      } else if (statusList[temp] == false) {
        color = kLightRedColor;
      } else {}
    }
    return Container(
      height: temp == currentQuestionNumber ? 80.0 : 60.00,
      width: temp == currentQuestionNumber ? 80.0 : 60.00,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
          child: Text(
            '$num',
            style: TextStyle(
                color: temp == currentQuestionNumber ? Colors.blue : Colors
                    .white,
                fontSize: temp == currentQuestionNumber ? 40 : 30,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
