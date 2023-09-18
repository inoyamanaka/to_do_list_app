//Store this globally
// ignore_for_file: strict_raw_type

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:to_do_list_app/features/crud/presentation/add/pages/add_activity_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/profile/pages/profile_page.dart';
import 'package:to_do_list_app/features/crud/presentation/schedule/pages/schedule_page.dart';
import 'package:to_do_list_app/features/crud/presentation/statistic/pages/statistic_page.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
const items = <TabItem>[
  TabItem(
    icon: FontAwesomeIcons.house,
    title: 'Home',
  ),
  TabItem(
    icon: FontAwesomeIcons.calendar,
    title: 'Event',
  ),
  TabItem(
    icon: FontAwesomeIcons.circlePlus,
    title: 'Add',
  ),
  TabItem(
    icon: FontAwesomeIcons.chartColumn,
    title: 'Statistic',
  ),
  TabItem(
    icon: FontAwesomeIcons.userAstronaut,
    title: 'Profile',
  ),
];

const page = <Widget>[
  HomePage(),
  SchedulePage(),
  AddActivityPage(),
  StatisticPage(),
  ProfilePage(),
];

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({super.key});

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

int selectedIndex = 0;

class _MyMenuPageState extends State<MyMenuPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        setState(() {
          selectedIndex = _tabController.index;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        colorSelected: Colors.black,
        indexSelected: selectedIndex,
        paddingVertical: 24,
        onTap: (int index) => setState(() {
          selectedIndex = index;
          _tabController.index = index;
        }),
        top: -25,
      ),
      body: Navigator(
        key: _navKey,
        onGenerateRoute: (_) => SwipeablePageRoute(
          transitionBuilder:
              (context, animation, secondaryAnimation, isSwipeGesture, child) =>
                  FadeTransition(
            opacity: animation,
            child: child,
          ),
          canOnlySwipeFromEdge: true,
          builder: (_) => TabBarView(
            controller: _tabController,
            children: page,
          ),
        ),
      ),
    );
  }
}
