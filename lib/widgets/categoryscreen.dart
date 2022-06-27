import 'package:flutter/material.dart';
import 'package:restaurantapp/data/fooddata.dart';
import 'package:restaurantapp/screens/fooditemscreen.dart';

class CategoryScren extends StatefulWidget {
  const CategoryScren({Key? key}) : super(key: key);

  @override
  State<CategoryScren> createState() => _CategoryScrenState();
}

class _CategoryScrenState extends State<CategoryScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catergories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoriesData.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodItemScreen(
                                  title: categoriesData[index]["title"],
                                  orderitem: categoriesData[index]['item'])),
                        )),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                categoriesData[index]["image"],
                                width: 80,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoriesData[index]["title"],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text("ID: ${categoriesData[index]["id"]}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
