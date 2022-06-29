import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurantapp/data/restrodata.dart';

class AllFoodSlider extends StatefulWidget {
  const AllFoodSlider({Key? key}) : super(key: key);

  @override
  State<AllFoodSlider> createState() => _AllFoodSliderState();
}

class _AllFoodSliderState extends State<AllFoodSlider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    Widget allFoodCard(
            {required String image,
            required String name,
            required int price,
            required double rate}) =>
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                image,
                width: 80,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: rate,
                      itemCount: 5,
                      itemSize: 8,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "($rate)",
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  "₹$price.00",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset("icons/edit.svg"),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset("icons/remove.svg")
          ],
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Theme.of(context).primaryColor)),
          child: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).primaryColor),
            unselectedLabelColor: Colors.black,
            controller: tabController,
            automaticIndicatorColorAdjustment: true,
            isScrollable: true,
            tabs: const [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Tab(
                child: Text("Veg",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
              Tab(
                child: Text("Non-Veg",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        Expanded(
          // width: width,
          // height: height / 2,
          child: TabBarView(controller: tabController, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: vegFoodList.length,
                        itemBuilder: (context, index) => allFoodCard(
                            image: vegFoodList[index]["image"],
                            name: vegFoodList[index]["name"],
                            price: vegFoodList[index]["price"],
                            rate: vegFoodList[index]["rating"].toDouble())),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: nonVegList.length,
                        itemBuilder: (context, index) => allFoodCard(
                            image: nonVegList[index]["image"],
                            name: nonVegList[index]["name"],
                            rate: nonVegList[index]["rating"].toDouble(),
                            price: nonVegList[index]["price"])),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: vegFoodList.length,
                  itemBuilder: (context, index) => allFoodCard(
                      image: vegFoodList[index]["image"],
                      name: vegFoodList[index]["name"],
                      price: vegFoodList[index]["price"],
                      rate: vegFoodList[index]["rating"].toDouble())),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nonVegList.length,
                  itemBuilder: (context, index) => allFoodCard(
                      image: nonVegList[index]["image"],
                      name: nonVegList[index]["name"],
                      price: nonVegList[index]["price"],
                      rate: nonVegList[index]["rating"].toDouble())),
            ),
          ]),
        ),
      ],
    );
  }
}
