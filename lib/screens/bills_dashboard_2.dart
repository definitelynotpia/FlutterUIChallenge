import 'package:flutter/material.dart';
// flutter packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BillsDashboard2 extends StatefulWidget {
  const BillsDashboard2({super.key});

  @override
  State<StatefulWidget> createState() => _BillsDashboard2();
}

class _BillsDashboard2 extends State<BillsDashboard2> {
  // color gradient
  final List<Color> colorGradient = [
    const Color(0xff0097b2),
    const Color(0xff7ed957)
  ];

  // random user profile
  final NetworkImage userAvatar =
      const NetworkImage("https://avatar.iran.liara.run/public");

  String? _searchTerm = "";

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
        title: Column(
          children: [
            const SizedBox(height: 5),
            Row(
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
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      // Username
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 6),
                        child: Text(
                          "Frances Rey",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Balance
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon
                          FaIcon(
                            FontAwesomeIcons.crown,
                            color: Colors.white,
                            size: 12,
                          ),
                          // spacing
                          SizedBox(width: 5),
                          // Account level
                          Text(
                            "Priority",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // appbar buttons
                CircleAvatar(radius: 40, backgroundImage: userAvatar),
              ],
            ),
          ],
        ),
      ),

      // page content
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight - 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Credit card
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  right: 30,
                  left: 30,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: colorGradient,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                // card details
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // balance
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // dollar sign
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4),
                                  child: FaIcon(
                                    FontAwesomeIcons.dollarSign,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),

                                // spacer
                                SizedBox(width: 2),

                                Text(
                                  "5,500.",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "00",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Balance",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        // bank logo
                        FaIcon(
                          FontAwesomeIcons.flutter,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    // spacing
                    SizedBox(height: 25),

                    // card no.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // card no.
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "****",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "123-456-7890",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        // bank name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Flutter Bank",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Credit Card",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Payment section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Wrap(
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
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.sackDollar,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        // Label
                        const Text(
                          "Transfer",
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
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.commentsDollar,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        // Label
                        const Text(
                          "Request",
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
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.qrcode,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        // Label
                        const Text(
                          "Scan",
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
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.moneyBillTransfer,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        // Label
                        const Text(
                          "Swap",
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
                              color: Colors.white.withOpacity(0.1),
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
              ),

              // search bar and filter button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // search form
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: (screenWidth - 120)),
                      child: TextFormField(
                        // focusNode: myFocusNode,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // border inactive
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border active
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // icon
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          // label
                          hintText: "Search here",
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        onChanged: (value) => _searchTerm = value,
                      ),
                    ),

                    // icon button
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        iconSize: 20,
                        icon: const FaIcon(
                          FontAwesomeIcons.sliders,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

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
                            fontSize: 12,
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

                  // spacing
                  const SizedBox(height: 10),

                  // List view
                  Container(
                    margin:
                        const EdgeInsets.only(right: 25, left: 25, bottom: 78),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  // icon
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const FaIcon(
                                      FontAwesomeIcons.arrowDownWideShort,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),

                                  // transaction info
                                  const Column(
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
                                ],
                              ),

                              // type
                              const Text(
                                "Payment",
                                style: TextStyle(color: Colors.white),
                              ),

                              // status
                              (index == 4 || index == 7)
                                  ? const Text(
                                      "Failed",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const Text(
                                      "Success",
                                      style: TextStyle(color: Colors.green),
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

      // bottom nav
      bottomNavigationBar: Stack(
        children: [
          // gradient background
          Container(
            height: 58,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colorGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),

          // // bottom navbar
          Container(
            height: 58,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GNav(
              tabBackgroundGradient: LinearGradient(
                colors: colorGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              gap: 10,
              tabBorderRadius: 100,
              color: Colors.black.withOpacity(0.2),
              activeColor: Colors.white,
              iconSize: 20,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
              tabBackgroundColor: Colors.grey[800]!,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              duration: const Duration(milliseconds: 800),

              tabs: const [
                GButton(
                  icon: FontAwesomeIcons.house,
                  text: 'Home',
                ),
                GButton(
                  icon: FontAwesomeIcons.barsProgress,
                  text: 'Stats',
                ),
                GButton(
                  icon: FontAwesomeIcons.wallet,
                  text: 'Wallet',
                ),
                GButton(
                  icon: FontAwesomeIcons.person,
                  text: 'Account',
                ),
              ],
              selectedIndex: 0,
              // onTabChange: _tabChanged,
            ),
          ),
        ],
      ),
    );
  }
}
