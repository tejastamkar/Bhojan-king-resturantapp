import 'package:flutter/material.dart';
import 'package:restaurantapp/data/orderdata.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({Key? key}) : super(key: key);

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: orderData.length,
            itemBuilder: (context, index) {
              return Text(
                  "${orderData[index]["Name"]} (${orderData[index]["number"]})");
            }),
      ],
    );
  }
}
