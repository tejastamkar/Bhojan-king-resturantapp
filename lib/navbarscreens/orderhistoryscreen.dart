import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurantapp/widgets/sliderorder.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int today = 3, week = 14, month = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order History",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "icons/BagCheck.svg",
                                width: 10,
                                height: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$today",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "This Week",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "icons/BagCheck.svg",
                                width: 10,
                                height: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$week",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "This Month",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "icons/BagCheck.svg",
                                width: 10,
                                height: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$month",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliderOrder(),
          ],
        ),
      ),
    );
  }
}
