import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantapp/screens/loginscreen.dart';
import 'package:restaurantapp/screens/passwordscreen.dart';
import 'package:restaurantapp/screens/selecttypeofpartner.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (() {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginScreen())));
                        }),
                        child: SvgPicture.asset("icons/xicon.svg")),
                    const Spacer(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "REGISTER WITH US",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "only for Restaurant Partner",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selected == 0
                          ? "Restaurant Name"
                          : "Stall Name/ owner name",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 2),
                        child: SizedBox(
                          width: width,
                          child: TextField(
                            maxLines: 3,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "First Name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Last Name",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Phone No",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Email ID",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const PasswordScreen())));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
