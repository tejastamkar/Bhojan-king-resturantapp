import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/navbarscreens/campaignscreen.dart';
import 'package:restaurantapp/navbarscreens/homescreen.dart';
import 'package:restaurantapp/navbarscreens/orderhistoryscreen.dart';
import 'package:restaurantapp/navbarscreens/restroscreen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int selectedIndex = 0;
  final screens = [
    const HomeScreen(),
    const OrderHistoryScreen(),
    const RestroScreen(),
    const CampaignScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navicons/Home.svg',
              color: selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navicons/historyicon.svg',
              color: selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navicons/ShopWindow.svg',
              color: selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (SvgPicture.asset(
              'navicons/Gift.svg',
              color: selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromRGBO(165, 153, 153, 1),
        onTap: (index) => {
          setState(() {
            selectedIndex = index;
          }),
        },
      ),
    );
  }
}
