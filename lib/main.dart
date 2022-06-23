import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:restaurantapp/screens/loginscreen.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) => ResponsiveWrapper.builder(
      child,
      maxWidth: 1920,
      minWidth: 370,
      defaultScale: true,
      breakpoints: [
        const ResponsiveBreakpoint.resize(370, name: MOBILE),
        const ResponsiveBreakpoint.resize(720, name: TABLET),
        const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ],
      background: Container(
        color: Theme.of(context).primaryColorLight,
      ),
    ),
    theme: ThemeData(
        backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
        primaryColor: const Color.fromRGBO(179, 19, 64, 1),
        primaryColorLight: const Color.fromRGBO(243, 243, 243, 1),
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Color.fromRGBO(179, 19, 64, 1))),
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return const LoginScreen();
  }
}
