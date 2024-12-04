import 'package:flutter/material.dart';

class RestaurantStore extends StatefulWidget {
  const RestaurantStore({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantStore();
}

class _RestaurantStore extends State<RestaurantStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
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
