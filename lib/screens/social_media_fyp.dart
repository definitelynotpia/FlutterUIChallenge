import 'package:flutter/material.dart';
// packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pexels_api/pexels_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocialMediaFyp extends StatefulWidget {
  const SocialMediaFyp({super.key});

  @override
  State<StatefulWidget> createState() => _SocialMediaFyp();
}

class _SocialMediaFyp extends State<SocialMediaFyp> {
  // color gradient
  final List<Color> colorGradient = [
    const Color(0xff8c52ff),
    const Color(0xff5ce1e6)
  ];

  // random user profile
  final NetworkImage userAvatar =
      const NetworkImage("https://avatar.iran.liara.run/public");

  // pexels api
  late PexelsClient _pexelsClient;
  final int _imageCount = 10; // Number of images to fetch
  String apiKey = dotenv.env['PEXELS_API_KEY']!;

  // Define imageUrls as a Future
  late Future<List<String>> imageUrls;

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
        var photo = await _pexelsClient.getPhoto(); // Fetch a random photo
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
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      extendBody: true,

      // app bar
      appBar: AppBar(
        backgroundColor: const Color(0xff1f1f1f),
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        titleSpacing: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // menu
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bars,
                size: 20,
                color: Colors.white,
              ),
            ),
            // logo
            const FaIcon(
              FontAwesomeIcons.solidComment,
              size: 25,
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            const Text(
              "Chatterbox",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            // spacer
            const Spacer(),

            // search button
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            // settings button
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),

      // page content
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // image carousel with username and profile picture overlay
            Container(
              height: 150,
              margin: const EdgeInsets.only(bottom: 10),
              child: FutureBuilder<List<String>>(
                future: imageUrls, // Fetch images
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 150,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ); // Loading state
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text("Error: ${snapshot.error}")); // Error state
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text("No images found.")); // Empty data state
                  }

                  final imageUrls = snapshot.data!;

                  return ListView.builder(
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: _imageCount,
                    itemBuilder: (context, index) {
                      final imageUrl = imageUrls[index];

                      return Padding(
                        padding: EdgeInsets.only(
                          left: (index == 0) ? 15 : 4,
                          right: 4,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl,
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // profile
                            SizedBox(
                              height: 150,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // avatar
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 4),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: userAvatar,
                                    ),
                                  ),

                                  // spacer
                                  const SizedBox(height: 10),

                                  // username
                                  const Text(
                                    "Username",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  // time
                                  const Text(
                                    "10 mins",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // posts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 4) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidNoteSticky,
                            color: Colors.grey,
                            size: 60,
                          ),
                          Text(
                            "No more posts...",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // poster data
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // profile picture
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: userAvatar,
                              ),
                              // username and time posted
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Username",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "10 mins ago",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // more button
                              RotatedBox(
                                quarterTurns: 1,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),

                          // post content
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 5),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Irure cupidatat do cillum pariatur do officia consequat exercitation dolore ad ad culpa sint veniam.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          // buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // react
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.heart,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "React",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // spacing
                              const SizedBox(width: 5),

                              // reply
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.solidComment,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Reply",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // spacing
                              const SizedBox(width: 5),

                              // repost
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.share,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Repost",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),

      // floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),

      // bottom navbar
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xff252525),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FaIcon(
              FontAwesomeIcons.house,
              color: Colors.white,
              size: 20,
            ),
            FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.white,
              size: 20,
            ),
            FaIcon(
              FontAwesomeIcons.compass,
              color: Colors.white,
              size: 20,
            ),
            FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.white,
              size: 20,
            ),
            FaIcon(
              FontAwesomeIcons.person,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
