import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  // random user profile
  final NetworkImage userAvatar =
      const NetworkImage("https://avatar.iran.liara.run/public");

  List<bool> deviceState = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    // initialize device states
    // for (var i; i < 6; i++) {
    //   deviceState.add(false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      extendBody: true,

      // app bar
      appBar: AppBar(
        backgroundColor: const Color(0xff1f1f1f),
        scrolledUnderElevation: 0,
        toolbarHeight: 110,
        titleSpacing: 30,
        // appbar text
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome message
                  Text(
                    "Good Morning!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  // Username
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Frances Rey",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),

            // appbar buttons
            CircleAvatar(radius: 32, backgroundImage: userAvatar),
          ],
        ),
      ),

      // page content
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: (screenWidth <= 375) ? 20 : 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // temp and electric consumption
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // temp
                    Container(
                      width: (screenWidth - 50) * 0.47,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // amount
                              Text(
                                "30°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // date
                              Text("Today",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                            ],
                          ),

                          // icon
                          FaIcon(
                            FontAwesomeIcons.cloudSun,
                            size: 45,
                            color: Color(0xff4fc4e3),
                          ),
                        ],
                      ),
                    ),

                    // kwh
                    Container(
                      width: (screenWidth - 50) * 0.47,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // amount
                              Text(
                                "50 kWh",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // date
                              Text(
                                "This Week",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          // icon
                          FaIcon(
                            FontAwesomeIcons.lightbulb,
                            size: 40,
                            color: Color(0xff4fc4e3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // quick access
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    // title
                    const Padding(
                      padding: EdgeInsets.only(left: 6, bottom: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quick access",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // buttons
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 1,
                      children: [
                        // Wifi button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // IconButton
                            IconButton(
                              onPressed: () => {},
                              icon: Container(
                                width: 55,
                                height: 55,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.wifi,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Label
                            const Text(
                              "Wi-Fi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        // Electricity button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // IconButton
                            IconButton(
                              onPressed: () => {},
                              icon: Container(
                                width: 55,
                                height: 55,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.chartSimple,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Label
                            const Text(
                              "Usage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        // Education button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // IconButton
                            IconButton(
                              onPressed: () => {},
                              icon: Container(
                                width: 55,
                                height: 55,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.bolt,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Label
                            const Text(
                              "Electric",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        // View All button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // IconButton
                            IconButton(
                              onPressed: () => {},
                              icon: Container(
                                width: 55,
                                height: 55,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.music,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Label
                            const Text(
                              "Music",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        // View All button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // IconButton
                            IconButton(
                              onPressed: () => {},
                              icon: Container(
                                width: 55,
                                height: 55,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            // Label
                            const Text(
                              "More",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // spacing + divider
              const Divider(thickness: 0.5),

              // tabview (devices and statistic)
              // devices (grid builder)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: (screenWidth <= 375)
                        ? (screenWidth / 370)
                        : (screenWidth / 320),
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: (index != 0)
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.05),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.1)))
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: colorGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // icon and checkbox field
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // icon
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(100),
                                  color:
                                      (index == 0) ? Colors.white : Colors.grey,
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.lightbulb,
                                  size: 30,
                                  color: (index == 0)
                                      ? const Color(0xff227fa8)
                                      : Colors.white,
                                ),
                              ),

                              // checkbox
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // label
                                  const Text(
                                    "Device",
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  // custom switch with transparent border
                                  Theme(
                                    data: ThemeData(
                                      useMaterial3: true,
                                    ).copyWith(
                                      colorScheme: Theme.of(context)
                                          .colorScheme
                                          .copyWith(
                                              outline: Colors.transparent),
                                    ),
                                    child: Switch(
                                      // This bool value toggles the switch.
                                      value: deviceState[index],
                                      // trackOutlineColor: Colors.white,
                                      inactiveThumbColor: (index == 0)
                                          ? const Color(0xff4fc4e3)
                                          : Colors.white,
                                      inactiveTrackColor: (index == 0)
                                          ? Colors.white.withOpacity(0.7)
                                          : Colors.white.withOpacity(0.5),
                                      activeTrackColor: (index == 0)
                                          ? Colors.white.withOpacity(0.7)
                                          : Colors.white.withOpacity(0.5),
                                      activeColor: (index == 0)
                                          ? const Color(0xff4fc4e3)
                                          : Colors.white,
                                      onChanged: (bool value) {
                                        // This is called when the user toggles the switch.
                                        setState(() {
                                          deviceState[index] = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // device name
                              Text(
                                "AC-00$index",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // device type
                              Text(
                                "${deviceState[index]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // docked floating button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        elevation: 50,
        shape: const CircleBorder(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              colors: colorGradient,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 60,
              color: Colors.white,
            ),
          ),
        ),
      ),

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color(0xff252525),
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // left icons
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.tableCellsLarge,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.gaugeHigh,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),

            // spacer
            SizedBox(width: screenWidth * 0.3),

            // right icons
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.rocket,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
