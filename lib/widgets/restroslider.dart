import 'package:flutter/material.dart';
import 'package:restaurantapp/data/restrodata.dart';
import 'package:restaurantapp/widgets/allfoodslider.dart';
import 'package:restaurantapp/widgets/reviewcard.dart';

class RestroSlider extends StatefulWidget {
  const RestroSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<RestroSlider> createState() => _RestroSliderState();
}

class _RestroSliderState extends State<RestroSlider>
    with TickerProviderStateMixin {
  int selected = 0;
  bool value = false;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selected = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = _tabController;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          child: TabBar(
            labelColor: Colors.black,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black,
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "All Food",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: height / 2,
          child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: AllFoodSlider()),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: reviewList.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ReviewCard(
                                    image: reviewList[index]["image"],
                                    dishname: reviewList[index]["dishname"],
                                    name: reviewList[index]["name"],
                                    review: reviewList[index]["review"],
                                    date: reviewList[index]["date"],
                                    rating:
                                        reviewList[index]["rate"].toDouble()),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: width - 100,
                                    height: 2,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ))),
                )
              ]),
        ),
      ],
    );
  }
}
