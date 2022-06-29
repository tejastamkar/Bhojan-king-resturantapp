import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/widgets/sliderdinning.dart';

class DinningScreen extends StatefulWidget {
  const DinningScreen({Key? key}) : super(key: key);

  @override
  State<DinningScreen> createState() => _DinningScreenState();
}

class _DinningScreenState extends State<DinningScreen> {
  int today = 3, week = 14, month = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Dinning",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SliderDinning(),
          ],
        ),
      ),
    );
  }
}
