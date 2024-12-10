import 'package:flutter/material.dart';
import 'dart:convert';
// packages
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
  late Future<List<dynamic>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        print("API Response: ${response.body}"); // Debug output
        return json.decode(response.body);
      } else {
        print("Failed to load products. Status Code: ${response.statusCode}");
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error fetching products: $e");
      throw e;
    }
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
        toolbarHeight: 60,
        titleSpacing: 25,
        // back and info buttons
        title: Stack(
          children: [
            // screen title
            const Align(
              alignment: Alignment.center,
              child: Text(
                "My Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // back button
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0x09ffffff),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // icon
                          FaIcon(
                            FontAwesomeIcons.angleLeft,
                            color: Colors.white,
                            size: 12,
                          ),
                          // label
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Back",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // spacer
                const Spacer(),

                // side bar
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0x09ffffff),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.bars,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // page content
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // products
              SizedBox(
                height: screenHeight - 400,
                child: FutureBuilder<List<dynamic>>(
                  future: products,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final productList = snapshot.data!;
                      return ListView.separated(
                        itemCount: productList.length,
                        separatorBuilder: (context, index) => const Divider(
                            thickness: 1.0, color: Color(0x09ffffff)),
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // image
                                Image.network(
                                  product[
                                      'image'], // Use product['image'] as the source
                                  width: 50, // Set the width of the image
                                  height: 60, // Set the height of the image
                                  fit: BoxFit
                                      .cover, // Ensures the image maintains aspect ratio and fits inside
                                ),

                                // description
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 18),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // name
                                        Text(
                                          product['title'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        // category
                                        Text(
                                          product['category'],
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),

                                        // spacer
                                        const SizedBox(height: 8),

                                        // qty in cart
                                        const Text(
                                          'Qty: 1',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // price and stock
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$${product['price']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Stock: 21',
                                      style: TextStyle(color: Colors.grey),
                                    ),

                                    // spacer
                                    const SizedBox(height: 8),

                                    // Remove button
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          "Remove",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),

              // cart details
              Container(
                constraints: const BoxConstraints(minHeight: 248),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // order
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: const Color(0x09ffffff),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Order Summary",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                              FaIcon(FontAwesomeIcons.ellipsis,
                                  color: Colors.white),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Order Details",
                                  style: TextStyle(color: Colors.white)),
                              Text("15 May 2024",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),

                          // spacer
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Subtotal",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$440.00",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Discount (10%)",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$44.00",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Tax (15%)",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$66.00",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Shipping",
                                  style: TextStyle(color: Colors.white)),
                              Text("\$50.00",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),

                          // spacer
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("\$512.00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // checkout button
      bottomNavigationBar: BottomAppBar(
        height: 100,
        padding: const EdgeInsets.only(bottom: 10),
        color: const Color(0xff1f1f1f), // background
        // text button
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0x09ffffff),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {},
            child: const Center(
              // label
              child: Text(
                "Check Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
