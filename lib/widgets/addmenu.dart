import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({Key? key}) : super(key: key);

  @override
  State<AddMenuScreen> createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  String name = "",
      decs = "",
      price = "",
      discount = "",
      dropdownValue = 'Precent',
      imagePath = "";

  bool veg = false, nonveg = false, size = false, type = false, addons = false;
  var isSelected = [false, false, false];

  Future<dynamic> takeUserProfileImage(ImageSource source) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(source: source);

    late PickedFile imagePickedFile;
    if (image != null) {
      setState(() {
        imagePickedFile = image;
        imagePath = imagePickedFile.path;
      });
    }
  }

  Future bottomSheet() => showModalBottomSheet(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Menu",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            const Text(
              "Food name",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                      hintText: "Food Name", border: InputBorder.none),
                  initialValue: name,
                  onChanged: (value) => setState(() {
                    name = value;
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  maxLines: 3,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                      hintText: "Description", border: InputBorder.none),
                  initialValue: name,
                  onChanged: (value) => setState(() {
                    name = value;
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Price",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "₹",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 300,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: const InputDecoration(
                              hintText: "Price", border: InputBorder.none),
                          initialValue: name,
                          onChanged: (value) => setState(() {
                            name = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Discount",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 200,
                      height: 70,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                hintText: "Discount", border: InputBorder.none),
                            initialValue: name,
                            onChanged: (value) => setState(() {
                              name = value;
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Discount Type",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 200,
                      height: 70,
                      child: Card(
                        child: Center(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            underline: Container(
                              height: 0,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Precent', 'Amount']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "Category",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Card(
              child: Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  underline: Container(
                    height: 0,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Precent', 'Amount']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
            ToggleButtons(
                selectedColor: Theme.of(context).primaryColor,
                children: [
                  Text("Sized"),
                  Text("Type"),
                  Text("Addon"),
                ],
                onPressed: (int index) {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                isSelected: isSelected),
            const SizedBox(
              height: 30,
            ),
            const Text("Food Type"),
            SizedBox(
              height: 20,
            ),
            if (imagePath == "")
              Center(
                child: Container(
                  width: width - 100,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                      onPressed: (() => bottomSheet()),
                    ),
                  ),
                ),
              )
            else
              Center(
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                    width: width - 100,
                    height: 200,
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: (() => bottomSheet()),
                  ),
                ]),
              ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
