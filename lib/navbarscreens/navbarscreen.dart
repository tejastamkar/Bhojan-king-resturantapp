import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/navbarscreens/campaignscreen.dart';
import 'package:restaurantapp/navbarscreens/homescreen.dart';
import 'package:restaurantapp/navbarscreens/orderhistoryscreen.dart';
import 'package:restaurantapp/navbarscreens/restroscreen.dart';
import 'package:restaurantapp/screens/dinningscreen.dart';
import 'package:restaurantapp/screens/helpsupportscreen.dart';
import 'package:restaurantapp/screens/loginscreen.dart';
import 'package:restaurantapp/screens/profillescreen.dart';
import 'package:restaurantapp/widgets/addmenu.dart';
import 'package:restaurantapp/widgets/categoryscreen.dart';
import 'package:restaurantapp/widgets/menubtn.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int selectedIndex = 0;
  bool openSheet = false;

  final screens = [
    const HomeScreen(),
    const OrderHistoryScreen(),
    const CampaignScreen(),
    const RestroScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List menuButtons = <Widget>[
      MenuButton(
          icons: SvgPicture.asset("icons/PersonCircle.svg"),
          name: "Profile",
          func: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()))),
      MenuButton(
          icons: SvgPicture.asset("icons/CreditCard.svg"),
          name: "Bank Info",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/addcart.svg"),
          name: "Add Food",
          func: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddMenuScreen()))),
      MenuButton(
          icons: SvgPicture.asset("icons/addons.svg"),
          name: "Addons",
          func: () {}),
      MenuButton(
          icons: Image.asset("icons/category.png"),
          name: "Categories",
          func: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CategoryScren()))),
      MenuButton(
          icons: SvgPicture.asset("icons/Globe2.svg"),
          name: "language",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset("icons/CalendarCheck.svg"),
          name: "Dinning",
          func: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DinningScreen()))),
      MenuButton(
          icons: SvgPicture.asset(
            "icons/mail.svg",
            color: Colors.white,
            width: 40,
            height: 40,
          ),
          name: "Help",
          func: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HelpAndSupportScreen()))),
      MenuButton(
          icons: SvgPicture.asset(
            "icons/fileicon.svg",
            width: 30,
            height: 30,
          ),
          name: "Term & Condition",
          func: () {}),
      MenuButton(
          icons: SvgPicture.asset(
            "icons/logout.svg",
            width: 10,
            height: 40,
          ),
          name: "Logout",
          func: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const LoginScreen())));
          }),
    ];

    Future navMenu() {
      return showModalBottomSheet(
        builder: (BuildContext context) => SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.arrow_forward_ios_rounded)),
                      )
                    ]),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menuButtons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: width < 440 ? 3 : 7),
                    itemBuilder: (context, index) => menuButtons[index]),
              ],
            ),
          ),
        ),
        context: context,
      );
    }

    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButton: InkWell(
        onTap: (() => setState(() => selectedIndex = 3)),
        child: ClipOval(
          child: Container(
            height: 60,
            width: 60,
            color: selectedIndex == 3
                ? Theme.of(context).primaryColor
                : Colors.white,
            child: Center(
              child: (SvgPicture.asset(
                'navicons/ShopWindow.svg',
                color: selectedIndex == 3 ? Colors.white : Colors.grey.shade300,
              )),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              'navicons/Gift.svg',
              color: selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (Icon(
              Icons.menu,
              color: Colors.grey.shade300,
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
            if (index == 3) {
              openSheet = true;
              navMenu();
            } else {
              selectedIndex = index;
            }
          }),
        },
      ),
    );
  }
}
