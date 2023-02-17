

import 'dart:io';
import 'package:applicationquestion/screen/point_screen.dart';
import 'package:applicationquestion/widgets/base_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.resultList}) : super(key: key);
  final List<int> resultList;
  String status = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (resultList[0] > resultList[1]) {
      status = 'winner';
    } else {
      status = 'loser';
    }
    return BaseWidget(
      children: [
        const SizedBox(
          height: 60.00,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  status == 'winner' ? kLightGreenColor : kLightRedColor,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50),
              )),
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              //const Spacer(),
              SizedBox(
                height: 600,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 60.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                              bottom: Radius.circular(50),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 160,
                            ),
                            Text(
                              status == 'winner'
                                  ? 'You Are Winner!'
                                  : 'You Lose',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == 'winner'
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Divider(
                              height: 2,
                              thickness: 3,
                              color: status == 'winner'
                                  ? Colors.green
                                  : Colors.red,
                              indent: 10,
                              endIndent: 10,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            pointRow(Icons.check, 'correct', '${resultList[0]}',
                                Colors.green),
                            const SizedBox(
                              height: 15,
                            ),
                            pointRow(Icons.close, 'wrong', '${resultList[1]}',
                                Colors.red),
                            const SizedBox(
                              height: 15,
                            ),
                            pointRow(Icons.check_box_outline_blank, 'white',
                                '${resultList[2]}', Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Image.asset(
                          'assets/images/${status == 'winner' ? 'correct.png' : 'wrong.png'}',
                          width: 150.0,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myButton(
                text: 'Play again',
                color: Colors.orangeAccent,
                onTap: () {
                  onPlayAgainPressed(context);
                },
                width: 150,
              ),
              myButton(
                text: 'Result',
                color: Colors.white,
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.infoReverse,
                    headerAnimationLoop: false,
                    body: Column(
                      children: [
                        TextField(
                          controller: controller,
                        )
                      ],
                    ),
                    btnOkOnPress: () {
                      //onOkpressed(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PointScreen(
                      //             name: controller.text,
                      //             resultList: resultList)));
                    },
                    btnCancelOnPress: () {},
                  ).show();
                },
                width: 150,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget pointRow(IconData icon, String text, String point, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          point,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget myButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
    required double width,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void onPlayAgainPressed(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Would you like to play again?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: myButton(
                            text: 'Yes',
                            color: kLightGreenColor,
                            onTap: () {
                              onYesPressed(context);
                            },
                            width: 90),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: myButton(
                            text: 'No',
                            color: kLightRedColor,
                            onTap: () {
                              onNoPressed(context);
                            },
                            width: 90),
                      )
                    ],
                  )
                ],
              ),
            ));
  }

  onYesPressed(context) {
    Phoenix.rebirth(context);
  }

  onNoPressed(context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  // void onOkpressed(context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   List<String> list = pref.getStringList('scores') ?? [];
  //   list.add(
  //       '${controller.text}/${resultList[0]}/${resultList[1]}/${resultList[2]}');
  //   await pref.setStringList('scores', list);
  //   print(pref.getStringList('scores'));
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context)
  //   => PointScreen(),

   // ),);
   // controller.clear();
  }
//}
