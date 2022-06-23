import 'package:flutter/material.dart';

class RestroScreen extends StatefulWidget {
  const RestroScreen({Key? key}) : super(key: key);

  @override
  State<RestroScreen> createState() => _RestroScreenState();
}

class _RestroScreenState extends State<RestroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "RestroScreen",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      )),
      body: Column(),
    );
  }
}
