import 'package:applicationquestion/widgets/question_container.dart';
import 'package:flutter/material.dart';

import '../model/question_model.dart';

class QuestionListRow extends StatelessWidget {
  const QuestionListRow({Key? key, required this.currentQuestionNumber, required this.statusList, required this.scrollController}) : super(key: key);
 final int currentQuestionNumber;
 final List statusList;
 final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < questionList.length; i++) {
      list.add(QuestionContainer(
        num: i + 1,
        currentQuestionNumber:currentQuestionNumber,
        statusList: statusList,));
    }
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
