import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});

  @override
  State<StatefulWidget> createState() => _Instructions();
}

class _Instructions extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1f1f1f),
      extendBody: true,

      // page content
      body: Center(
          child: Text(
        "Swipe to view different UI",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
