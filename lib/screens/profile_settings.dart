import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileSettings();
}

class _ProfileSettings extends State<ProfileSettings> {
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
