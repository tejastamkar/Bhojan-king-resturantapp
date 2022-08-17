import 'package:flutter/material.dart';
import 'package:restaurantapp/screens/signup.dart';

List typesofPartnerList = [
  {
    "name": "Dining",
    "image": "assets/delivery.png",
    "selected": false,
  },
  {
    "name": "Delivery",
    "image": "assets/dinning.png",
    "selected": false,
  },
  {
    "name": "Nightery",
    "image": "assets/nighty.png",
    "selected": false,
  },
];

class ServiceType extends StatefulWidget {
  const ServiceType({Key? key}) : super(key: key);

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget typeCard(
            {required String name,
            required int index,
            required String image}) =>
        InkWell(
          onTap: () => setState(() {
            setState(() {
              typesofPartnerList[index]["selected"] =
                  !typesofPartnerList[index]["selected"];
            });
          }),
          child: SizedBox(
            height: 100,
            width: 30,
            child: Card(
                child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Image.asset(image),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      color: typesofPartnerList[index]["selected"]
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: typesofPartnerList[index]["selected"]
                      ? const Center(
                          child: Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        ))
                      : const SizedBox())
            ])),
          ),
        );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              onPrimary: Colors.white,
              primary: Theme.of(context).primaryColor),
          onPressed: (() => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()))),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Services",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (() => Navigator.pop(context)),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Which Services you want to Provide",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: typesofPartnerList.length,
              itemBuilder: (BuildContext context, int index) => typeCard(
                  name: typesofPartnerList[index]["name"],
                  index: index,
                  image: typesofPartnerList[index]["image"]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 440 ? 2 : 4, childAspectRatio: 1),
            ),
          ],
        ),
      ),
    );
  }
}
