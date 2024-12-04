import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
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
