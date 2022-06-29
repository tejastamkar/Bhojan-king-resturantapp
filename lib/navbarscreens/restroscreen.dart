import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurantapp/data/fooddata.dart';
import 'package:restaurantapp/screens/restrosetting.dart';
import 'package:restaurantapp/widgets/addmenu.dart';
import 'package:restaurantapp/widgets/restroslider.dart';

class RestroScreen extends StatefulWidget {
  const RestroScreen({Key? key}) : super(key: key);

  @override
  State<RestroScreen> createState() => _RestroScreenState();
}

class _RestroScreenState extends State<RestroScreen>
    with TickerProviderStateMixin {
  int current = 0;
  bool showBtn = false;
  double rating = 3.5;
  int totalRating = 2;
  String image =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlUcgsI0_JFJAAWkPkuvYwSHfpThEwzWzI7A&usqp=CAU",
      name = "Maharaja Bhog",
      address = "Goregaon east, Oberior mall";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButtonLocation: flo,
      floatingActionButton: showBtn
          ? FloatingActionButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddMenuScreen())),
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add_circle_outline_outlined,
                size: 40,
              ),
            )
          : null,
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notificationList) {
            if (notificationList.direction == ScrollDirection.forward) {
              setState(() => showBtn = true);
            } else if (notificationList.direction == ScrollDirection.reverse) {
              setState(() => showBtn = false);
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              height: width < 440 ? width / 2 : width / 3,
                              aspectRatio: 1 / 1,
                              viewportFraction: 1,
                              initialPage: 0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 10),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.linearToEaseOut,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  current = index;
                                });
                              }),
                          items: carouselList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.network(
                                  i,
                                  scale: 1 / 1,
                                  fit: BoxFit.cover,
                                  width: width,
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: CarouselIndicator(
                            height: 10,
                            width: 10,
                            animationDuration: 100,
                            cornerRadius: 10,
                            color: const Color.fromARGB(250, 255, 255, 255),
                            activeColor: Theme.of(context).primaryColor,
                            count: carouselList.length,
                            index: current,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestroSettingScreen(
                                    price: 400,
                                    name: name,
                                    address: address,
                                    phoneNumber: 123459602))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: const Icon(
                            Icons.mode_edit_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(image,
                              width: 80, height: 60, fit: BoxFit.fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            address,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.61)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_purple500_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$rating",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.61)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$totalRating rating",
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.61),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                const RestroSlider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
