import 'package:flutter/material.dart';
import 'package:restaurantapp/data/campaigndata.dart';
import 'package:restaurantapp/widgets/campaigncard.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Campaign",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
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
                      "Basic Campaign",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Food Campaign",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width,
              height: height,
              child: TabBarView(
                  controller: tabController,
                  physics: const ScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) => CampaignCard(
                                  image: basicCampaign[index]["image"],
                                  name: basicCampaign[index]["name"],
                                  decs: basicCampaign[index]["decs"],
                                  date: basicCampaign[index]["date"],
                                  created: basicCampaign[index]["own"],
                                  join: basicCampaign[index]["Join"]))),
                          const SizedBox(
                            height: 52,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  onPrimary: Colors.white,
                                  primary: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10)),
                              onPressed: () {},
                              child: const Text(
                                "Create Your Own Campaign",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) => CampaignCard(
                                  image: foodCampaign[index]["image"],
                                  name: foodCampaign[index]["name"],
                                  decs: foodCampaign[index]["decs"],
                                  date: foodCampaign[index]["date"],
                                  created: foodCampaign[index]["own"],
                                  join: foodCampaign[index]["Join"]))),
                          const SizedBox(
                            height: 52,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  onPrimary: Colors.white,
                                  primary: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10)),
                              onPressed: () {},
                              child: const Text(
                                "Create Your Own Campaign",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
