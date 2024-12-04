import 'package:flutter/material.dart';

class IotDashboard extends StatefulWidget {
  const IotDashboard({super.key});

  @override
  State<StatefulWidget> createState() => _IotDashboard();
}

class _IotDashboard extends State<IotDashboard> {
  // color gradient
  List<Color> colorGradient = [
    const Color(0xff227fa8),
    const Color(0xff4fc4e3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      extendBody: true,

      // app bar
      appBar: AppBar(
        // appbar text
        title: const Text(""),
      ),

      // page content
      body: Container(),
    );
  }
}
