import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/screens/servicetype.dart';
import 'package:restaurantapp/screens/signup.dart';

class TypeofPartner extends StatefulWidget {
  const TypeofPartner({Key? key}) : super(key: key);

  @override
  State<TypeofPartner> createState() => _TypeofPartnerState();
}

int selected = 0;

class _TypeofPartnerState extends State<TypeofPartner> {
  List typesofPartnerList = [
    {
      "name": "Restuarant",
      "image": "assets/restroselectorimage.svg",
    },
    {
      "name": "Street Vendors",
      "image": "assets/foodstallSelectorimage.svg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget typeCard(
            {required String name,
            required int index,
            required String image}) =>
        InkWell(
          onTap: () => setState(() {
            selected = index;
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
                      SvgPicture.asset(image),
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
                      color: selected == index
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: selected == index
                      ? Center(
                          child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
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
          onPressed: (() => selected == 0
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ServiceType()))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()))),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Who are you",
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
              "Select any one",
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
