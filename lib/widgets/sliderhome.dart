import 'package:flutter/material.dart';
import 'package:restaurantapp/data/orderdata.dart';
import 'package:restaurantapp/widgets/ordedetails.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> with TickerProviderStateMixin {
  int selected = 0;
  bool value = false;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

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

    Widget orderCard(
            {required int orderNo,
            required String date,
            required String time,
            required int itemNo}) =>
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
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
                    Text(
                      "$itemNo Item",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.black45)),
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
                    Tab(
                      child: Text(
                        "Pending (${pendingOrderData.length})",
                        style: const TextStyle(
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
                    Tab(
                      child: Text(
                        "Confirmed (${confirmedOrderData.length})",
                        style: const TextStyle(
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
                  children: [
                    Tab(
                      child: Text(
                        "Cooking (${cookingOrderData.length})",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: selected != 2 ? 10 : 0),
                    selected != 2
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
                    Tab(
                      child: Text(
                        "Ready For Handover (${readyOrderData.length})",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: selected != 3 ? 10 : 0),
                    selected != 3
                        ? Container(
                            width: 2,
                            height: 20,
                            color: Colors.grey.shade300,
                          )
                        : const SizedBox(),
                  ],
                ),
                Tab(
                  child: Text(
                    "Food On The Way (${foodOntheWayData.length})",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  value: value,
                  onChanged: (f) {
                    setState(() {
                      value = f!;
                    });
                  }),
              const Text(
                "Campaign Order",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          width: width,
          height: 250,
          child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pendingOrderData.length,
                    itemBuilder: (context, index) => pendingOrderData.isEmpty
                        ? const Text("")
                        : InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                          orderNo: pendingOrderData[index]
                                              ["orderId"],
                                          item: pendingOrderData[index]["item"],
                                          date: pendingOrderData[index]["date"],
                                          time: pendingOrderData[index]["time"],
                                          type: "",
                                          showtype: false,
                                          food: pendingOrderData[index]["food"],
                                          confimed: true,
                                          msg: 'Cooking',
                                        ))),
                            child: orderCard(
                                orderNo: pendingOrderData[index]["orderId"],
                                date: pendingOrderData[index]["date"],
                                time: pendingOrderData[index]["time"],
                                itemNo: pendingOrderData[index]["item"]),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: confirmedOrderData.length,
                    itemBuilder: (context, index) => confirmedOrderData.isEmpty
                        ? const Text("")
                        : InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                          food: confirmedOrderData[index]
                                              ["food"],
                                          orderNo: confirmedOrderData[index]
                                              ["orderId"],
                                          item: confirmedOrderData[index]
                                              ["item"],
                                          date: confirmedOrderData[index]
                                              ["date"],
                                          time: confirmedOrderData[index]
                                              ["time"],
                                          type: "",
                                          showtype: false,
                                          confimed: true,
                                          msg: 'Delivery Order',
                                        ))),
                            child: orderCard(
                                orderNo: confirmedOrderData[index]["orderId"],
                                date: confirmedOrderData[index]["date"],
                                time: confirmedOrderData[index]["time"],
                                itemNo: confirmedOrderData[index]["item"]),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cookingOrderData.length,
                    itemBuilder: (context, index) => cookingOrderData.isEmpty
                        ? const Text("")
                        : InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                          food: cookingOrderData[index]["food"],
                                          orderNo: cookingOrderData[index]
                                              ["orderId"],
                                          item: cookingOrderData[index]["item"],
                                          date: cookingOrderData[index]["date"],
                                          time: cookingOrderData[index]["time"],
                                          type: "",
                                          showtype: false,
                                          confimed: false,
                                          msg: '',
                                        ))),
                            child: orderCard(
                                orderNo: cookingOrderData[index]["orderId"],
                                date: cookingOrderData[index]["date"],
                                time: cookingOrderData[index]["time"],
                                itemNo: cookingOrderData[index]["item"]),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: readyOrderData.length,
                    itemBuilder: (context, index) => readyOrderData.isEmpty
                        ? const Text("")
                        : orderCard(
                            orderNo: readyOrderData[index]["orderId"],
                            date: readyOrderData[index]["date"],
                            time: readyOrderData[index]["time"],
                            itemNo: readyOrderData[index]["item"]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foodOntheWayData.length,
                    itemBuilder: (context, index) => foodOntheWayData.isEmpty
                        ? const Text("")
                        : orderCard(
                            orderNo: foodOntheWayData[index]["orderId"],
                            date: foodOntheWayData[index]["date"],
                            time: foodOntheWayData[index]["time"],
                            itemNo: foodOntheWayData[index]["item"]),
                  ),
                ),
              ]),
        )
      ],
    );
  }
}
