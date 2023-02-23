import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/screens/bottom_tab_screens/feeds_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/global_notification_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/profile_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/select_school_screen.dart';
import 'package:school_project/screens/quiz_screens/quiz_screen.dart';

import '../utils/app_colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> getScreensList() {
    return [
      const FeedsScreen(),
      const QuizScreen(),
      const SelectSchoolScreen(),
      const GlobalNotificationScreen(),
      const ProfileScreen(),
      // const QuizScreen(),
      // const RegisterScreen(),
      // const NotificationScreen(),
      // const ProfileScreen(),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: getScreensList(),
        items: _navBarsItems(),
        onItemSelected: _onItemTapped,
        confineInSafeArea: true,
        backgroundColor: AppColors.primaryColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          colorBehindNavBar: Colors.transparent,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 10,
              offset: const Offset(1, 1),
              spreadRadius: 1.0,
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 30,
        // padding: EdgeInsets.only(top: 10),
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.feed),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        title: "Feed",
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.quiz),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        title: "Quiz",
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorSecondary: _selectedIndex == 2 ? Colors.white : Colors.grey,
        activeColorPrimary:
            _selectedIndex == 2 ? Colors.blue : AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        title: "Notification",
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        title: "Profile",
      ),
    ];
  }
}
