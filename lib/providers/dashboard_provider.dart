import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/main.dart';
import 'package:school_project/screens/bottom_tab_screens/feeds_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/global_notification_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/profile_screen.dart';
import 'package:school_project/screens/bottom_tab_screens/select_school_screen.dart';
import 'package:school_project/screens/home_screen/home_screen.dart';
import 'package:school_project/screens/quiz_screens/quiz_screen.dart';
import 'package:school_project/utils/app_string.dart';

class DashBoardProvider extends ChangeNotifier{
  int selectedIndex = 0;
  bool isLoggedIn = (spPreferences?.getBool(spKeys().isLoggedIn)??false);
  late PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  notifyListeners();

  List<Widget> get getScreensList => [
    const FeedsScreen(),
    const QuizScreen(),
    const SelectSchoolScreen(),
    const GlobalNotificationScreen(),
    const ProfileScreen(),
  ];
  List<Widget> get getScreensList2 => [
    const FeedsScreen(),
    const QuizScreen(),
    const HomeScreen(),
    const GlobalNotificationScreen(),
    const ProfileScreen(),
  ];

  updateLoggedInStatus({required bool loggedIn}){
    isLoggedIn = loggedIn;
    spPreferences?.setBool(spKeys().isLoggedIn,loggedIn);
    notifyListeners();
  }

  changeTabIndex({required int tabIndex}){
    controller.jumpToTab(tabIndex);
    selectedIndex = tabIndex;
    notifyListeners();
  }

  setSelectedIndex({required int index}){
    selectedIndex = index;
    notifyListeners();
  }

  onItemTapped(int index) {
      if (isLoggedIn) {
        selectedIndex = index;
      }else{
        if(index == 4){
          controller.jumpToTab(2);
          selectedIndex = 2;
        }else{
          selectedIndex = index;
        }
      }
      notifyListeners();
  }

  logOutUser(){
    controller.jumpToTab(0);
    selectedIndex = 0;
    spPreferences?.clear();
    isLoggedIn = false;
    notifyListeners();
  }

}