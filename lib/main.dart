import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: const Color.fromRGBO(179, 19, 64, 1),
        primaryColorLight: const Color.fromRGBO(243, 243, 243, 1),
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black)),
    home: const Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
