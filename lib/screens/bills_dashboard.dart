import 'package:flutter/material.dart';
// flutter packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
// custom widgets
import '../widgets/circle_painter.dart';

class BillsDashboard extends StatefulWidget {
  const BillsDashboard({super.key});

  @override
  State<StatefulWidget> createState() => _BillsDashboard();
}

class _BillsDashboard extends State<BillsDashboard> {
  // color gradient
  List<Color> colorGradient = [
    const Color(0xff632fc3),
    const Color(0xfffc616a)
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      extendBody: true,

      // app bar
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        scrolledUnderElevation: 0,
        toolbarHeight: 120,
        titleSpacing: 30,
        // appbar text
        title: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      const Text(
                        "Hello User!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 2),
                        child: Text(
                          "Your available balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      // Balance
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Balance amount
                          const Text(
                            "\$50,0",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          // spacing
                          const SizedBox(width: 5),
                          // View icon
                          IconButton(
                            onPressed: () => {},
                            iconSize: 20,
                            icon: const FaIcon(
                              FontAwesomeIcons.eye,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                // appbar buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // notification
                    IconButton(
                      onPressed: () => {},
                      padding: EdgeInsets.zero,
                      icon: const FaIcon(
                        FontAwesomeIcons.bell,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    // spacer
                    const SizedBox(height: 12),
                    // scanner
                    IconButton(
                      onPressed: () => {},
                      padding: EdgeInsets.zero,
                      icon: const FaIcon(
                        FontAwesomeIcons.qrcode,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // page content
      body: Stack(
        children: [
          // Purple blurred circle
          Positioned(
            left: -400,
            top: screenHeight / 7,
            child: CustomPaint(
              size: const Size(500, 500),
              painter: BlurredCirclePainter(
                color: const Color(0xff682d9c),
                radius: 250,
                position: const Offset(250, 250),
                blurSigma: 100.0, // Adjust this for more or less blur
              ),
            ),
          ),

          // Pink blurred circle
          Positioned(
            left: screenWidth - 75,
            top: screenHeight / 1.9,
            child: CustomPaint(
              size: const Size(150, 150),
              painter: BlurredCirclePainter(
                color: const Color(0xff85144c),
                radius: 75,
                position: const Offset(75, 75),
                blurSigma: 50.0, // Adjust this for more or less blur
              ),
            ),
          ),

          // page content
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight - 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // top up, swap, request
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 30,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: colorGradient,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Top Up Button
                        InkWell(
                          onTap: () => {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Icon
                              FaIcon(
                                FontAwesomeIcons.arrowUpFromBracket,
                                color: Colors.white,
                                size: 25,
                              ),
                              // Spacing
                              SizedBox(height: 5),
                              // Label
                              Text(
                                "Top Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),

                        // Swap Button
                        InkWell(
                          onTap: () => {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Icon
                              FaIcon(
                                FontAwesomeIcons.arrowRightArrowLeft,
                                color: Colors.white,
                                size: 25,
                              ),
                              // Spacing
                              SizedBox(height: 5),
                              // Label
                              Text(
                                "Swap",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),

                        // Request Button
                        InkWell(
                          onTap: () => {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Icon
                              RotatedBox(
                                quarterTurns: 2,
                                child: FaIcon(
                                  FontAwesomeIcons.arrowUpFromBracket,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              // spacing
                              SizedBox(height: 5),
                              // Label
                              Text(
                                "Request",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Payment section
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 6, bottom: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment List",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // bills
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
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
                                    width: 70,
                                    height: 70,
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: colorGradient,
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.wifi,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                // Label
                                const Text(
                                  "Internet",
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
                                    width: 70,
                                    height: 70,
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: colorGradient,
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.boltLightning,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                // Label
                                const Text(
                                  "Electricity",
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
                                    width: 70,
                                    height: 70,
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: colorGradient,
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.userGraduate,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                // Label
                                const Text(
                                  "Education",
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
                                    width: 70,
                                    height: 70,
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: colorGradient,
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.globe,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                // Label
                                const Text(
                                  "View All",
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

                  // spacer
                  const SizedBox(height: 5),

                  // promo & discount carousel
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Promo and Discount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // promo and discount carousel
                  CarouselSlider(
                    items: List<Widget>.generate(3, (int index) {
                      // card
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(128, 128, 128, 128),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // promo details
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // description
                                    const Text(
                                      "Get Up To 10% Off!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "On education payments",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    // spacer
                                    const SizedBox(height: 10),

                                    // button
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                          'Click Here',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // image
                              const FaIcon(
                                FontAwesomeIcons.moneyBill,
                                size: 100,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    options: CarouselOptions(
                      height: 130,
                      aspectRatio: 1 / 2,
                      viewportFraction: 0.85,
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.22,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  // spacer
                  const SizedBox(height: 20),

                  // transactions history
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Section title
                            Text(
                              "Transactions",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Spacer
                            Spacer(),

                            // Filter option
                            Text(
                              "Sort by ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Latest",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // List view
                      Container(
                        margin: const EdgeInsets.only(
                            right: 25, left: 25, bottom: 78),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(8),
                          // Shrink the ListView to the size of its content
                          shrinkWrap: true,
                          // Prevent nested scrolling conflict
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                                  color: Color.fromARGB(118, 255, 255, 255)),
                          itemBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Manila Water",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Jan. 11, 2024",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),

                                  // type
                                  Text(
                                    "Payment",
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  // status
                                  Text(
                                    "Success",
                                    style: TextStyle(color: Color(0xffffe81b)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottom nav
      bottomNavigationBar: Stack(
        children: [
          // gradient background
          Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colorGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),

          // // bottom navbar
          SizedBox(
            height: 80,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              // selected design
              selectedFontSize: 0,
              selectedItemColor: Colors.white,
              // unselected design
              unselectedFontSize: 0,
              unselectedItemColor: const Color.fromARGB(69, 0, 0, 0),
              type: BottomNavigationBarType.fixed,
              elevation: 0,

              // navbar index
              currentIndex: 0,

              items: const <BottomNavigationBarItem>[
                // home
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: "Home",
                ),
                // statistics
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.barsProgress),
                  label: "Stats",
                ),
                // wallet
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.wallet),
                  label: "Wallet",
                ),
                // account
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.person),
                  label: "Account",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
