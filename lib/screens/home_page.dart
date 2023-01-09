import 'package:buddy/colors/colors.dart';
import 'package:buddy/screens/calendar.dart';
import 'package:buddy/screens/main_page.dart';
import 'package:buddy/screens/shop.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _page=0;
  late PageController  pageController=PageController();
  @override
  void initstate(){
    super.initState();
    pageController.dispose();
  }
  void navigationTapped(int page){
    pageController.jumpToPage(page);
    setState(() {
      _page=page;
    });
    print(_page);
  }
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: appColor.background,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: appColor.barcolor,
        selectedItemColor: appColor.iconColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home_rounded,
                  size: 38,
              ),
              label:'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: appColor.iconColor,
                size: 35,
              ),
              label:'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.currency_rupee_outlined,
                color: appColor.iconColor,
                size: 35,
              ),
              label:'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_rounded,
                color: appColor.iconColor,
                size: 35,
              ),
              label:'Home'
          ),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        children: [
          mainPage(),
          calendarPage(),
          shopList(),
          Center(child: Text("profile")),
        ],
        controller: pageController,
      )
    );
  }
}

Widget buildcircularitem(int index){
  return Container(
    child: Column(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2021/12/26/12/11/dog-6895017_960_720.jpg"
          ) ,
        )
      ],

    ),
  );
}
