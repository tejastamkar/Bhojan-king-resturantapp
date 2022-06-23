import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurantapp/navbarscreens/navbarscreen.dart';
import 'package:restaurantapp/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false, isPassword = true;
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
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 10),
                child: Center(child: Image.asset("assets/logo.png")),
              ),
              const Text(
                "LOGIN IN",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "only for Restaurant Partner",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("icons/mail.svg"),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 100,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'E-mail ID',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("icons/lock.svg"),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: width - 100,
                          height: 37,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () => setState(() {
                                    isPassword = !isPassword;
                                  }),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      activeColor: Theme.of(context).primaryColor,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as bool;
                        });
                      },
                    ),
                    const Text(
                      "Remeber me",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 10),
                      onPrimary: Colors.white,
                      primary: Theme.of(context).primaryColor),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavbarScreen()));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const RegisterScreen())));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "join as",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.61)),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Restaurant",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
