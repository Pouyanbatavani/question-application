import 'package:flutter/material.dart';

import '../constant.dart';

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({Key? key, required this.isOnePressed, required this.num, required this.answer, required this.onTapped}) : super(key: key);

  final bool isOnePressed;
  final int num;
  final String answer;
  final VoidCallback onTapped;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            color: isOnePressed && num == 1 || !isOnePressed && num == 2
                ? const Color(0xff84a2ff)
                : const Color(0xff8fdcff),
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            color: isOnePressed && num == 1 || !isOnePressed && num == 2
                ? kPurpleColor
                : kLightBlueColor,
          )
        ]),
        child: Text(
          answer,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
