import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int selected = 0;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List langangeList = ["English", "Hindi", "Marathi"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget langCard({required String name, required int index}) => InkWell(
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
                      SvgPicture.asset("icons/translator.svg"),
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
          onPressed: (() {}),
          child: const Text(
            "Save",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          "Language",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: langangeList.length,
          itemBuilder: (BuildContext context, int index) =>
              langCard(name: langangeList[index], index: index),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width < 440 ? 2 : 4, childAspectRatio: 1),
        ),
      ),
    );
  }
}
