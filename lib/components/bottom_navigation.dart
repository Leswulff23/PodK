import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:podk/view/category_page.dart';
import 'package:podk/view/home_page.dart';
import 'package:podk/components/colors.dart' as color;
import 'package:podk/view/playlist_page.dart';
import 'package:podk/view/settings_page.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const PlaylistScreen(),
    const SettingScreen(),

  ];



  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 55,
        iconSize: 24.0,
        backgroundColor: color.AppColor.tabColor,
        activeColor: color.AppColor.mainColor,
        inactiveColor: color.AppColor.whiteColor,
        currentIndex: currentIndex,
        border: Border.all(color: Colors.transparent),
        onTap: (int index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check_circle_sharp),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ]
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: screens[currentIndex],
          );
        });
      },
    );
  }
}