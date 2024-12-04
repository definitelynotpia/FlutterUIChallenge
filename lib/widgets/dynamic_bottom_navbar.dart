import 'package:flutter/material.dart';

class DynamicBottomNavbar extends StatefulWidget {
  // ui parameters
  final Color backgroundColor;
  final int selectedFontSize;
  final Color selectedItemColor;
  final int unselectedFontSize;
  final Color unselectedItemColor;
  final int elevation;
  // navigation parameters
  final List<Widget> screens;
  int currentIndex;
  int currentTab;
  Widget currentScreen;
  String currentScreenTitle;

  DynamicBottomNavbar({
    super.key,
    // ui
    required this.backgroundColor,
    required this.selectedFontSize,
    required this.selectedItemColor,
    required this.unselectedFontSize,
    required this.unselectedItemColor,
    required this.elevation,
    // navigation
    required this.screens,
    required this.currentIndex,
    required this.currentTab,
    required this.currentScreen,
    required this.currentScreenTitle,
  });

  @override
  State<StatefulWidget> createState() => _DynamicBottomNavbar();
}

class _DynamicBottomNavbar extends State<DynamicBottomNavbar> {
  // get bottomnavbar items
  List<BottomNavigationBarItem> getNavBarItems() {
    // initialize item list
    List<BottomNavigationBarItem> navBarItems = <BottomNavigationBarItem>[];

    // for each screen in screens, create a navbar item
    for (var i = 0; i < widget.screens.length; i++) {
      navBarItems.add(
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc, size: 0),
          label: (widget.screens[i] as dynamic).title,
        ),
      );
    }

    // return as widget list
    return navBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      // selected design
      selectedFontSize: 0,
      selectedItemColor: Colors.white,
      // unselected design
      unselectedFontSize: 0,
      unselectedItemColor: const Color(0x66402e52),
      type: BottomNavigationBarType.fixed,
      elevation: 0,

      // navbar index
      currentIndex: widget.currentTab,
      onTap: (int index) {
        setState(() {
          widget.currentTab = index;
          widget.currentScreen = widget.screens[index];
          widget.currentScreenTitle = (widget.screens[index] as dynamic).title;
        });
      },
      // generate BottomNavigationBar buttons based on
      // screens listed in PageStorageBucket
      items: getNavBarItems(),
    );
  }
}
