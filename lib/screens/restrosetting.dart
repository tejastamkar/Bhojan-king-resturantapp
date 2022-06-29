// ignore_for_file: use_build_context_synchronously

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

TimeOfDay openTime = TimeOfDay.now().replacing(hour: 00, minute: 00);
TimeOfDay closeTime = TimeOfDay.now().replacing(hour: 00, minute: 00);

List restroImage = [];

List schedule = [
  {
    "Sunday": ["08:30 - 04:00", "07:00 - 11:30"],
    "Monday": [],
    "Tuesday": [],
    "Wednesday": [],
    "Thursday": [],
    "Friday": [],
    "Saturday": [],
  }
];
bool veg = false, nonveg = false, dinning = false, deilvery = false;

class RestroSettingScreen extends StatefulWidget {
  final String name, address;
  final int phoneNumber, price;
  const RestroSettingScreen(
      {Key? key,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.price})
      : super(key: key);

  @override
  State<RestroSettingScreen> createState() => _RestroSettingScreenState();
}

class _RestroSettingScreenState extends State<RestroSettingScreen> {
  String name = "", address = "", phoneNo = "", price = "";

  Future<dynamic> takeUserProfileImage(ImageSource source) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(source: source);

    late PickedFile imagePickedFile;
    if (image != null) {
      setState(() {
        imagePickedFile = image;
        restroImage.add(imagePickedFile.path);
      });
    }
  }

  Future errorpopup({required String msg}) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  msg,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ));

  Future addpopup() => showModalBottomSheet(
        builder: (BuildContext context) => Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.camera),
                onPressed: () async {
                  await takeUserProfileImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: const Text("Camera"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.image),
                onPressed: () async {
                  await takeUserProfileImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: const Text("Gallery"),
              )
            ],
          ),
        ),
        context: context,
      );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget schedulePop({required String day}) => Builder(
        builder: (context) => SizedBox(
              height: 300,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Schedule for $day",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 0.61)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Open Time",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.35)),
                            ),
                            InkWell(
                              onTap: (() => Navigator.of(context).push(
                                    showPicker(
                                      context: context,
                                      value: openTime,
                                      onChange: (TimeOfDay newTime) {
                                        setState(() {
                                          openTime = newTime;
                                        });
                                      },
                                      minuteInterval: MinuteInterval.FIFTEEN,
                                    ),
                                  )),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${openTime.hour} : ${openTime.minute}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: 15,
                                          width: 2,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Close Time",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.35)),
                            ),
                            InkWell(
                              onTap: (() => Navigator.of(context).push(
                                    showPicker(
                                      context: context,
                                      value: closeTime,
                                      onChange: (TimeOfDay newTime) {
                                        setState(() {
                                          closeTime = newTime;
                                        });
                                      },
                                      minuteInterval: MinuteInterval.FIFTEEN,
                                    ),
                                  )),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${closeTime.hour} : ${closeTime.minute}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: 15,
                                          width: 2,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            onPrimary: Colors.black,
                            primary: const Color.fromRGBO(196, 196, 196, 0.49)),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            schedule[0][day].add(
                                "${openTime.hour}:${openTime.minute} - ${closeTime.hour}:${closeTime.minute}");
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            onPrimary: Colors.white,
                            primary: Theme.of(context).primaryColor),
                        child: const Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer()
                    ],
                  )
                ],
              ),
            ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resturant Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Resturant Name",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  initialValue: name == "" ? widget.name : name,
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
            ),
            const Text("Contact Number",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  initialValue:
                      phoneNo == "" ? "${widget.phoneNumber}" : phoneNo,
                  onChanged: (value) {
                    phoneNo = value;
                  },
                ),
              ),
            ),
            const Text("Address",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  initialValue: address == "" ? widget.address : address,
                  onChanged: (value) {
                    address = value;
                  },
                ),
              ),
            ),
            const Text("Food Type"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    value: veg,
                    onChanged: (f) {
                      setState(() {
                        veg = f!;
                      });
                    }),
                const Text(
                  "Veg",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 40,
                ),
                Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    value: nonveg,
                    onChanged: (f) {
                      setState(() {
                        nonveg = f!;
                      });
                    }),
                const Text(
                  "Non-veg",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Text("Daily Schedule Time",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sunday",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  const Text(
                    ":",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width - 120,
                    height: 50,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: schedule[0]["Sunday"].length + 1,
                      itemBuilder: (context, index) => schedule[0]["Sunday"]
                                      .length !=
                                  0 &&
                              index < schedule[0]["Sunday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Sunday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Sunday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Sunday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Sunday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const Spacer(),
                ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Monday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Monday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Monday"].length != 0 &&
                              index < schedule[0]["Monday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Monday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Monday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Monday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Monday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Tuesday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Tuesday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Tuesday"].length != 0 &&
                              index < schedule[0]["Tuesday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Tuesday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Tuesday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Tuesday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Tuesday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Wednesday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Wednesday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Wednesday"].length != 0 &&
                              index < schedule[0]["Wednesday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Wednesday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Wednesday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Wednesday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Wednesday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Thursday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Thursday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Thursday"].length != 0 &&
                              index < schedule[0]["Thursday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Thursday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Thursday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Thursday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Thursday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Friday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Friday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Friday"].length != 0 &&
                              index < schedule[0]["Friday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Friday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Friday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Friday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Friday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "Saturday",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Text(
                ":",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: width - 120,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: schedule[0]["Saturday"].length + 1,
                  itemBuilder: (context, index) =>
                      schedule[0]["Saturday"].length != 0 &&
                              index < schedule[0]["Saturday"].length
                          ? Center(
                              child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(schedule[0]["Saturday"][index]),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (() => setState(() {
                                            schedule[0]["Saturday"]
                                                .removeAt(index);
                                          })),
                                      child: SvgPicture.asset(
                                        "icons/cancel.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          : InkWell(
                              onTap: (() => schedule[0]["Saturday"].length < 2
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          child: schedulePop(day: "Saturday")))
                                  : errorpopup(msg: "Can't add more Schedule")),
                              child: const Card(
                                color: Color.fromRGBO(42, 52, 102, 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                ),
              ),
              const Spacer(),
            ]),
            const Text("Food Type",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "₹",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        initialValue: price == "" ? "${widget.price}" : price,
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    SvgPicture.asset("icons/deliveryicon.svg"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Delivery",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    const Spacer(),
                    Switch(
                      onChanged: (
                        bool value,
                      ) {
                        if (deilvery == false) {
                          setState(() {
                            deilvery = true;
                          });
                        } else {
                          setState(() {
                            deilvery = false;
                          });
                        }
                      },
                      value: deilvery,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    SvgPicture.asset("icons/dinning.svg"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Dinning",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    const Spacer(),
                    Switch(
                      onChanged: (
                        bool value,
                      ) {
                        if (dinning == false) {
                          setState(() {
                            dinning = true;
                          });
                        } else {
                          setState(() {
                            dinning = false;
                          });
                        }
                      },
                      value: dinning,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const Text("Add Pictures of Resturants",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Center(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  itemCount: restroImage.length + 1,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 1,
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemBuilder: (BuildContext context, int index) =>
                      restroImage.isNotEmpty && index < restroImage.length
                          ? Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: SizedBox(
                                    height: 120,
                                    width: 260,
                                    child: Image.file(
                                      File(restroImage[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      restroImage.removeAt(index);
                                    });
                                  },
                                )
                              ],
                            )
                          : InkWell(
                              onTap: (() => restroImage.length < 21
                                  ? addpopup()
                                  : errorpopup(msg: "Can't add more pictures")),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 260,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const Center(
                                    child: Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
