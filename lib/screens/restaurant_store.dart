import 'package:flutter/material.dart';
// packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pexels_api/pexels_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
// import 'package:http/http.dart' as http;

class RestaurantStore extends StatefulWidget {
  const RestaurantStore({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantStore();
}

class _RestaurantStore extends State<RestaurantStore> {
  // color palette
  final Color yellowA = const Color(0xffffe17a);
  final Color yellowB = const Color(0xffe99302);
  final Color orange = const Color(0xffe97102);

  // search
  String? _searchTerm = "";

  double rating = 0;

  // random user profile
  final NetworkImage userAvatar =
      const NetworkImage("https://avatar.iran.liara.run/public");

  // pexels api
  late PexelsClient _pexelsClient;
  String apiKey = dotenv.env['PEXELS_API_KEY']!;

  // Define imageUrls as a Future
  late Future<String> imageUrl;

  @override
  void initState() {
    super.initState();
    _pexelsClient = PexelsClient(apiKey); // Replace with your Pexels API key
    imageUrl = _fetchImageUrl(); // Initialize the Future
  }

  // Fetch a single image URL related to "food"
  Future<String> _fetchImageUrl() async {
    try {
      // Search for photos with the query "food"
      final result = await _pexelsClient.searchPhotos("food",
          collection: PexelsCollection.Regular,
          orientation: PexelsPhotoOrientation.portrait);

      // check if result contains photos
      if (result!.items.isNotEmpty) {
        final PexelsPhoto? photo = result.items.first;
        // access image url
        var imageUrl = photo!.get(ImageFormats.medium);

        if (imageUrl != null) {
          return imageUrl; // get image url
        }
      }
      return ""; // empty url if no image found
    } catch (e) {
      debugPrint("Error fetching image: $e");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      // extendBody: true,

      // app bar
      appBar: AppBar(
        // appbar text
        backgroundColor: yellowB,
        scrolledUnderElevation: 0,
        toolbarHeight: 100,
        titleSpacing: 30,
        title: Row(
          children: [
            // avatar
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: userAvatar,
              ),
            ),

            // account details
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      "Frances Rey",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    // address
                    Text(
                      "123 Street, City, Province",
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // notification
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
      ),

      // page content
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // shape
            Container(
              height: screenHeight * 0.24,
              width: screenWidth,
              decoration: BoxDecoration(
                color: yellowB,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Content - search, food banner, categories title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // search bar
                      TextFormField(
                        // focusNode: myFocusNode,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // background
                          filled: true,
                          fillColor: Colors.white,
                          // border inactive
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // border active
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // icon
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                          // label
                          hintText: "Search here",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                        onChanged: (value) => _searchTerm = value,
                      ),

                      // product banner
                      FutureBuilder<String>(
                        future: imageUrl, // Fetch images
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: 200,
                              width: screenWidth,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    "Error: ${snapshot.error}")); // Error state
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text(
                                    "No image found.")); // Empty data state
                          }

                          final image = snapshot.data!;

                          return Container(
                            height: 200,
                            width: screenWidth,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // tag
                                Container(
                                  margin: const EdgeInsets.only(bottom: 6),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: yellowA,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text("Featured"),
                                ),

                                // title
                                const Text(
                                  "Seafood Stew",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),

                                // description
                                SizedBox(
                                  width: screenWidth * 0.5,
                                  child: const Text(
                                    "Mollit magna dolor minim culpa incididunt id. Excepteur amet culpa velit id mollit ea ea velit et ad elit ex culpa. Do aliqua minim Lorem eiusmod excepteur quis ut aliqua mollit adipisicing eu sunt fugiat.",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      // categories title
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // title
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            // button
                            Text(
                              "See All",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // categories
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemBuilder: (context, index) {
                      final List<String> categoryList = [
                        "Western",
                        "Dessert",
                        "Seafood",
                        "Vegan",
                        "Drinks",
                      ];

                      final List<IconData> categoryIcons = [
                        FontAwesomeIcons.burger,
                        FontAwesomeIcons.iceCream,
                        FontAwesomeIcons.fishFins,
                        FontAwesomeIcons.carrot,
                        FontAwesomeIcons.mugHot,
                      ];

                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: yellowA,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // icon
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: FaIcon(
                                    categoryIcons[index],
                                    color: orange,
                                  ),
                                ),
                                // label
                                Text(categoryList[index]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // voucher banner
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: yellowB,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // promo info
                            Text(
                              "Dolor minim sunt laborum excepteur ea.",
                              style: TextStyle(color: Colors.white),
                            ),
                            // icon
                            FaIcon(
                              FontAwesomeIcons.ticket,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),

                      // promo list
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // icon
                                FaIcon(
                                  FontAwesomeIcons.coins,
                                  color: yellowB,
                                  size: 40,
                                ),

                                // promo info
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // title
                                      Text(
                                        "Duis Velit Incididunt",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      // subtitle
                                      Text(
                                        "Voluptate commodo et ipsum",
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),

                                // spacer
                                const Spacer(),

                                // icon
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.angleRight,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // rate service
                Container(
                  height: screenHeight * 0.22,
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Stack(
                    children: [
                      // close button
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white.withOpacity(0.6),
                              size: 30,
                            ),
                          ),
                        ),
                      ),

                      // food and prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // food image
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(top: 45),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: userAvatar,
                            ),
                          ),

                          // spacing
                          const SizedBox(width: 20),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // rate prompt
                              SizedBox(
                                width: screenWidth * 0.6,
                                child: const Text(
                                  "Rate our service on your last order",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                              ),

                              // spacer
                              const SizedBox(height: 10),

                              // rating
                              RatingStars(
                                value: rating,
                                onValueChanged: (v) {
                                  //
                                  setState(() {
                                    rating = v;
                                  });
                                },
                                starBuilder: (index, color) => FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: color,
                                ),
                                starCount: 5,
                                starSize: 40,
                                maxValue: 5,
                                starSpacing: 0,
                                maxValueVisibility: false,
                                valueLabelVisibility: false,
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      // bottom navbar
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.transparent,
        padding: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            color: yellowB,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.house,
                color: Colors.white,
                size: 25,
              ),
              FaIcon(
                FontAwesomeIcons.cartShopping,
                color: Colors.white,
                size: 25,
              ),
              FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.white,
                size: 25,
              ),
              FaIcon(
                FontAwesomeIcons.person,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
