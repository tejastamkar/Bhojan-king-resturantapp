import 'package:flutter/material.dart';
import 'package:restaurantapp/data/orderdata.dart';

class SliderDinning extends StatefulWidget {
  const SliderDinning({Key? key}) : super(key: key);

  @override
  State<SliderDinning> createState() => _SliderDinningState();
}

class _SliderDinningState extends State<SliderDinning>
    with TickerProviderStateMixin {
  int selected = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

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

    Widget orderCard({
      required int orderNo,
      required String date,
      required String time,
    }) =>
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID: #$orderNo",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$date , $time",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                height: 2,
                color: Colors.grey.shade400,
              )
            ],
          ),
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: SizedBox(
              width: width,
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).primaryColor),
                unselectedLabelColor: Colors.black,
                controller: tabController,
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                tabs: [
                  Row(
                    children: [
                      const Tab(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(width: selected != 0 ? 10 : 0),
                      selected != 0
                          ? Container(
                              width: 2,
                              height: 20,
                              color: Colors.grey.shade300,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Row(
                    children: [
                      const Tab(
                        child: Text(
                          "Confirmed",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(width: selected != 1 ? 10 : 0),
                      selected != 1
                          ? Container(
                              width: 2,
                              height: 20,
                              color: Colors.grey.shade300,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Row(
                    children: const [
                      Tab(
                        child: Text(
                          "Cancelled",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: height - 300,
          child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: deliveredOrderData.length,
                      itemBuilder: (context, index) => orderCard(
                            orderNo: deliveredOrderData[index]['orderId'],
                            date: deliveredOrderData[index]['date'],
                            time: deliveredOrderData[index]['time'],
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: returnedOrderData.length,
                      itemBuilder: (context, index) => orderCard(
                            orderNo: returnedOrderData[index]['orderId'],
                            date: returnedOrderData[index]['date'],
                            time: returnedOrderData[index]['time'],
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cancelledOrderData.length,
                      itemBuilder: (context, index) => orderCard(
                            orderNo: cancelledOrderData[index]['orderId'],
                            date: cancelledOrderData[index]['date'],
                            time: cancelledOrderData[index]['time'],
                          )),
                ),
              ]),
        )
      ],
    );
  }
}
