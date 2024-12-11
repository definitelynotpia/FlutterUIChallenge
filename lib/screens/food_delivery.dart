import 'package:flutter/material.dart';
// packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pexels_api/pexels_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FoodDelivery extends StatefulWidget {
  const FoodDelivery({super.key});

  @override
  State<StatefulWidget> createState() => _FoodDelivery();
}

class _FoodDelivery extends State<FoodDelivery> {
  // color palette
  final Color white = Colors.white;
  final Color grey = Colors.grey;
  final Color green = const Color(0xff547258);
  final Color yellow = const Color(0xffffbd59);

  // get random user avatar
  final NetworkImage userAvatar =
      const NetworkImage("https://avatar.iran.liara.run/public");

  // search form
  String? _searchTerm = "";

  // pexels api
  late PexelsClient _pexelsClient;
  final int _imageCount = 3; // Number of images to fetch
  String apiKey = dotenv.env['PEXELS_API_KEY']!;

  // Define imageUrls as a Future
  late Future<List<String>> imageUrls;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();

    _pexelsClient = PexelsClient(apiKey); // Replace with your Pexels API key
    imageUrls = _fetchImageUrls(); // Initialize the Future
  }

  // Fetches a predetermined number of image URLs from Pexels
  Future<List<String>> _fetchImageUrls() async {
    try {
      List<String> fetchedUrls = []; // Temporary list to hold fetched URLs
      for (int i = 0; i < _imageCount; i++) {
        //
        final result = await _pexelsClient.searchPhotos("food",
            collection: PexelsCollection.Regular,
            orientation: PexelsPhotoOrientation.portrait);
        var photo = result!.items[i];

        if (photo != null) {
          var imageUrl = photo.get(ImageFormats.medium);
          if (imageUrl != null) {
            // add img url to list
            fetchedUrls.add(imageUrl);
          }
        }
      }
      return fetchedUrls;
    } catch (e) {
      debugPrint("Error fetching images: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        titleSpacing: 25,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // avatar
            CircleAvatar(
              radius: 20,
              backgroundImage: userAvatar,
            ),

            // brand and
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // brand
                Text(
                  "DELIVERIO",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                // slogan
                Text(
                  "Enjoy your meal!",
                  style: TextStyle(color: white, fontSize: 14),
                ),
              ],
            ),

            // sidebar
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: white,
                size: 24,
              ),
            ),
          ],
        ),
      ),

      // page content
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // bg decor
            Container(
              height: screenHeight * 0.27,
              width: screenWidth,
              color: green,
            ),

            // page content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    // focusNode: myFocusNode,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      // background
                      filled: true,
                      fillColor: Colors.white,
                      // border inactive
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
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
                        color: grey,
                      ),
                      // label
                      hintText: "Search here",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                    ),
                    onChanged: (value) => _searchTerm = value,
                  ),
                ),

                // image carousel with page
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: FutureBuilder<List<String>>(
                    future: imageUrls, // Fetch images
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 200,
                          width: screenWidth,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                "Error: ${snapshot.error}")); // Error state
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No image found.")); // Empty data state
                      }

                      final imageUrls = snapshot.data!;

                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // image carousel
                            CarouselSlider(
                              items: List<Widget>.generate(3, (int index) {
                                final image = imageUrls[index];
                                // card
                                return Column(children: [
                                  Stack(
                                    children: [
                                      // image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(22),
                                        child: Image.network(
                                          image,
                                          height: 220,
                                          width: screenWidth * 0.93,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      // shadow and text
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.7),
                                            ],
                                            stops: const [0.2, 0.9],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 30),
                                            child: Text(
                                              "Proident minim reprehenderit non cupidatat.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, page) {
                                        return GestureDetector(
                                          onTap: () =>
                                              _controller.animateToPage(page),
                                          child: Container(
                                            width: 12.0,
                                            height: 12.0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 4.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black.withOpacity(
                                                  page == index ? 0.9 : 0.4),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ]);
                              }),
                              carouselController: _controller,
                              options: CarouselOptions(
                                height: 240,
                                aspectRatio: 1 / 2,
                                viewportFraction: 0.93,
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
                          ]);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // special menu title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // title
                            Text(
                              "Special Menu",
                              style: TextStyle(color: grey),
                            ),

                            // button
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: TextStyle(color: grey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // special menu items (with food images)
                      FutureBuilder<List<String>>(
                        future: imageUrls, // Fetch images
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

                          final imageUrls = snapshot.data!;

                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 130,
                              crossAxisCount: 3,
                            ),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              final imageUrl = imageUrls[index];
                              final List<String> foodItems = [
                                "Breakfast",
                                "Lunch",
                                "Dinner"
                              ];

                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // image
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(
                                          image: NetworkImage(imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // label
                                  Text(
                                    foodItems[index],
                                    style: TextStyle(color: grey),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),

                      // promo banner
                      Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // promo info
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // title
                                  Text(
                                    "Free Delivery Order!",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  ),
                                  // subtitle
                                  Text(
                                    "For purchases over Php100",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),

                            // image
                            FaIcon(
                              FontAwesomeIcons.truck,
                              color: Colors.red,
                              size: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      // bottom navbar
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                FaIcon(
                  FontAwesomeIcons.house,
                  color: white,
                ),
                // label
                Text(
                  "Home",
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                FaIcon(
                  FontAwesomeIcons.clipboardList,
                  color: white,
                ),
                // label
                Text(
                  "List",
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                FaIcon(
                  FontAwesomeIcons.utensils,
                  color: white,
                ),
                // label
                Text(
                  "Menu",
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                FaIcon(
                  FontAwesomeIcons.envelope,
                  color: white,
                ),
                // label
                Text(
                  "Inbox",
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
