import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/data/notificationdata.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget notificationCard(
            {required String text, required bool status, required int index}) =>
        InkWell(
          onTap: () {
            notificationList[index]['status'] =
                !notificationList[index]['status'];
          },
          child: Card(
            color:
                status ? Colors.white : const Color.fromRGBO(255, 240, 227, 1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'icons/bell.svg',
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: width / 1.7,
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Notification",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Dismissible(
                          key: ValueKey(index),
                          child: notificationCard(
                              index: index,
                              text: notificationList[index]['text'],
                              status: notificationList[index]['status']),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
