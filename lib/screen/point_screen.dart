import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

// ignore: must_be_immutable
class PointScreen extends StatelessWidget {
  PointScreen({Key? key}) : super(key: key);

  String status = '';

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          kLightBlueBackgroundColor,
          kDarkBlueBackgroundColor,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
            future: loadData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                List<String> resultList = snapshot.data;
                return bodyMaker(resultList) ;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  bodyMaker(List<String> resultList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Center(
            child: Image.asset(
          'assets/images/point.png',
          height: 350,
        )),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          height: 450,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 22,
                          offset: Offset(0, 10),
                         )
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: const [
                      Text(
                        'User',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.check_box_outline_blank,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:const  BouncingScrollPhysics(),
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    String name=resultList[index].split('/')[0];
                    int right=int.parse(resultList[index].split('/')[1]);
                    int wrong=int.parse(resultList[index].split('/')[2]);
                    if (right > wrong) {
                       status = 'winner';
                    } else {
                     status = 'loser';
                    }
                     return Container(
                      margin: const EdgeInsets.only(left: 5,top: 5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(30)),
                          gradient: LinearGradient(colors: [
                            status == 'winner' ? kLightGreenColor : kLightRedColor,
                            Colors.white,
                          ])),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(children: [
                        Text(
                       resultList[index].split('/')[0],
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          resultList[index].split('/')[1],
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          resultList[index].split('/')[2],
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          resultList[index].split('/')[3],
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ]),
                    );
                    // return Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Text(resultList[index].split('/')[0]),
                    //       Text(resultList[index].split('/')[1]),
                    //       Text(resultList[index].split('/')[2]),
                    //       Text(resultList[index].split('/')[3]),
                    //     ],
                    //   ),
                    // );
                  },
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 5),
                //   decoration: BoxDecoration(
                //       borderRadius: const BorderRadius.horizontal(
                //           left: Radius.circular(30)),
                //       gradient: LinearGradient(colors: [
                //         status == 'winner' ? kLightGreenColor : kLightRedColor,
                //         Colors.white,
                //       ])),
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                //   child: Row(children: [
                //     Text(
                //       name,
                //       style: const TextStyle(
                //         fontSize: 22,
                //       ),
                //     ),
                //     const Spacer(),
                //     Text(
                //       '${resultList[0]}',
                //       style: const TextStyle(
                //           fontSize: 25, fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(
                //       width: 30,
                //     ),
                //     Text(
                //       '${resultList[1]}',
                //       style: const TextStyle(
                //           fontSize: 25, fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(
                //       width: 30,
                //     ),
                //     Text(
                //       '${resultList[2]}',
                //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                //     ),
                //   ]),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }

  loadData() {}

  //Future<List<String>> loadData() async {
    //SharedPreferences pref = await SharedPreferences.getInstance();
    //return pref.getStringList('scores') ?? [];
  }
//}
