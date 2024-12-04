import 'package:flutter/material.dart';

class SocialMediaFyp extends StatefulWidget {
  const SocialMediaFyp({super.key});

  @override
  State<StatefulWidget> createState() => _SocialMediaFyp();
}

class _SocialMediaFyp extends State<SocialMediaFyp> {
  // color gradient
  final List<Color> colorGradient = [
    const Color(0xff8c52ff),
    const Color(0xff5ce1e6)
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
