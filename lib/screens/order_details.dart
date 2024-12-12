import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<StatefulWidget> createState() => _OrderDetails();
}

class _OrderDetails extends State<OrderDetails> {
  // color palette
  final Color orange = const Color(0xffe48f18);
  final Color grey = Colors.grey;

  // stepper index
  int _index = 0;

  // toggle open expansion tile
  bool _viewStepper = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        titleSpacing: 25,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // back icon button
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: grey,
                size: 14,
              ),
            ),
            // page title
            // info button
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.question,
                    color: grey,
                    size: 14,
                  )),
            ),
          ],
        ),
      ),

      // page content
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // map
              Container(
                height: screenHeight * 0.5,
                width: screenWidth - 50,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              // Collapsible widget
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // row to toggle stepper view
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // title
                        Text(
                          "View Order Progress",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // expand button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _viewStepper =
                                  !_viewStepper; // Toggle the bool variable
                            });
                          },
                          icon: FaIcon(
                            _viewStepper
                                ? FontAwesomeIcons.angleDown
                                : FontAwesomeIcons.angleUp,
                            color: orange,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // stepper
                  ListView(
                    shrinkWrap: true,
                    children: [
                      (_viewStepper)
                          ? Stepper(
                              currentStep: _index,
                              controlsBuilder: (context, controller) {
                                return const SizedBox.shrink();
                              },
                              onStepTapped: (int index) {
                                setState(() {
                                  _index = index;
                                });
                              },
                              steps: <Step>[
                                Step(
                                  title: Text(
                                    "Order Placement",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index >= 0)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 0) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                                Step(
                                  title: Text(
                                    "Order Processing",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index == 1)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 1) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                                Step(
                                  title: Text(
                                    "Packaging",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index == 2)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 2) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                                Step(
                                  title: Text(
                                    "Shipping",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index == 3)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 3) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                                Step(
                                  title: Text(
                                    "Transit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index == 4)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 4) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                                Step(
                                  title: Text(
                                    "Delivery",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (_index == 5)
                                            ? orange
                                            : Colors.black),
                                  ),
                                  content: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: screenWidth - 50),
                                    child: const Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Magna minim",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  stepStyle: StepStyle(
                                    color: (_index >= 5) ? orange : grey,
                                    errorColor: Colors.red,
                                    connectorColor: orange,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        height: 100,
        padding: const EdgeInsets.only(top: 0, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // file icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: orange, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.fileLines,
                  color: orange,
                  size: 35,
                ),
              ),
            ),

            // support icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: orange, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.headset,
                  color: orange,
                  size: 35,
                ),
              ),
            ),

            // download invoice icon
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: screenWidth * 0.6,
                  height: 70,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      "Download Invoice",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
