import 'package:flutter/material.dart';

import '../constant.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

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
          child: SingleChildScrollView(
            child: SizedBox(
              height:
              MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
