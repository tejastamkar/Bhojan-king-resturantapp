import 'package:flutter/material.dart';

class AddonScreen extends StatefulWidget {
  const AddonScreen({Key? key}) : super(key: key);

  @override
  State<AddonScreen> createState() => _AddonScreenState();
}

class _AddonScreenState extends State<AddonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Addons",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      // body:  ,
    );
  }
}
