import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // customize scroll behavior
// screens
import './screens/instructions.dart';
import './screens/bills_dashboard.dart';
import './screens/bills_dashboard_2.dart';
import './screens/cart.dart';
import './screens/iot_dashboard.dart';
import './screens/profile_settings.dart';
import './screens/restaurant_store.dart';
import './screens/social_media_fyp.dart';

void main() {
  runApp(const MainApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  // allow other devices to scroll
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Challenge", // app title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false, // hide debug banner
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // icon size
  double navbarIconSize = 20;

  // page navigation with PageStorageBucket
  final Key instructions = const PageStorageKey("instructions");
  final Key billsDashboard = const PageStorageKey("billsDashboard");
  final Key billsDashboard2 = const PageStorageKey("billsDashboard2");
  final Key cart = const PageStorageKey("cart");
  final Key iotDashboard = const PageStorageKey("iotDashboard");
  final Key profileSettings = const PageStorageKey("profileSettings");
  final Key restaurantStore = const PageStorageKey("restaurantStore");
  final Key socialMediaFyp = const PageStorageKey("socialMediaFyp");

  late Instructions instructionsScreen;
  late BillsDashboard billsDashboardScreen;
  late BillsDashboard2 billsDashboard2Screen;
  late Cart cartScreen;
  late IotDashboard iotDashboardScreen;
  late ProfileSettings profileSettingsScreen;
  late RestaurantStore restaurantStoreScreen;
  late SocialMediaFyp socialMediaFypScreen;

  late List<Map<String, dynamic>> screens; // list of pages

  // initialize first page
  int currentTab = 0;
  // Shows Loading Default page
  late Widget currentScreen = const Center(child: CircularProgressIndicator());

  final PageStorageBucket bucket = PageStorageBucket();

  // tabbar controller
  late TabController tabController;

  @override
  void initState() {
    instructionsScreen = Instructions(key: instructions);
    billsDashboardScreen = BillsDashboard(key: billsDashboard);
    billsDashboard2Screen = BillsDashboard2(key: billsDashboard2);
    cartScreen = Cart(key: cart);
    iotDashboardScreen = IotDashboard(key: iotDashboard);
    profileSettingsScreen = ProfileSettings(key: profileSettings);
    restaurantStoreScreen = RestaurantStore(key: restaurantStore);
    socialMediaFypScreen = SocialMediaFyp(key: socialMediaFyp);

    // append all screens to
    screens = [
      {
        'widget': billsDashboard2Screen,
        'icon': Icon(Icons.payment, size: navbarIconSize),
      },
      {
        'widget': billsDashboardScreen,
        'icon': Icon(Icons.money, size: navbarIconSize),
      },
      {
        'widget': cartScreen,
        'icon': Icon(Icons.shopping_cart, size: navbarIconSize),
      },
      {
        'widget': iotDashboardScreen,
        'icon': Icon(Icons.lightbulb, size: navbarIconSize),
      },
      {
        'widget': profileSettingsScreen,
        'icon': Icon(Icons.person, size: navbarIconSize),
      },
      {
        'widget': restaurantStoreScreen,
        'icon': Icon(Icons.fastfood, size: navbarIconSize),
      },
      {
        'widget': socialMediaFypScreen,
        'icon': Icon(Icons.share, size: navbarIconSize),
      },
      {
        'widget': instructionsScreen,
        'icon': Icon(Icons.help, size: navbarIconSize),
      },
    ];

    tabController = TabController(length: screens.length, vsync: this);

    super.initState();
  }

  // get bottomnavbar items
  List<Tab> getTabBarItems() {
    // initialize item list
    List<Tab> tabBarItems = <Tab>[];

    // for each screen in screens, create a navbar item
    for (var i = 0; i < screens.length; i++) {
      Widget icon = screens[i]["icon"] as Widget;
      tabBarItems.add(Tab(icon: icon));
    }

    // return as widget list
    return tabBarItems;
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        extendBody: true,

        // page content
        body: SafeArea(
          // get current screen from PageStorageBucket
          child: TabBarView(
            controller: tabController,
            children:
                screens.map((screen) => screen['widget'] as Widget).toList(),
          ),
        ),

        // navigation
        bottomNavigationBar: SizedBox(
          // navbar height
          // height: MediaQuery.of(context).size.height * 0.05,
          height: 0,
          child: TabBar(
            // label decoration
            labelColor: const Color(0xff8d4fdf),
            unselectedLabelColor: const Color(0xff9881b5),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(),
            controller: tabController,
            tabs: getTabBarItems(),
          ),
        ),
      ),
    );
  }
}
