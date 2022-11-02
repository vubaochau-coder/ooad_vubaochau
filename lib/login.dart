import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/main_screen.dart';
import 'package:ooad_vubaochau/signup.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isNotShowPass = true;
  double borderRadius = 26;
  bool loadingLogIn = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: const Color.fromRGBO(238, 238, 238, 0),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    child: GradientText(
                      'EMA',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 68,
                      ),
                      colors: const [
                        Color.fromARGB(215, 24, 167, 176),
                        Color.fromARGB(115, 24, 167, 176),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 24,
                          ),
                          child: const Image(
                            image: AssetImage('images/login.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'E-mail or Username',
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(215, 24, 167, 176),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: borderRadius - 2,
                                    right: borderRadius - 2,
                                    bottom: (screenHeight * 2.5 * 1.1 / 10 / 4 -
                                            16) /
                                        2,
                                    top: (screenHeight * 2.5 * 1.1 / 10 / 4 -
                                            16) /
                                        2),
                              ),
                            ),
                            TextField(
                              obscureText: isNotShowPass,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.vpn_key,
                                  color: Color.fromARGB(215, 24, 167, 176),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(215, 24, 167, 176),
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: borderRadius,
                                    right: borderRadius,
                                    bottom: (screenHeight * 2.5 * 1.1 / 10 / 4 -
                                            16) /
                                        2,
                                    top: (screenHeight * 2.5 * 1.1 / 10 / 4 -
                                            16) /
                                        2),
                                suffixIcon: IconButton(
                                  icon: Icon(isNotShowPass
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color:
                                      const Color.fromARGB(215, 24, 167, 176),
                                  onPressed: () {
                                    setState(() {
                                      isNotShowPass = !isNotShowPass;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextButton(
                              onPressed: null,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(215, 24, 167, 176),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(215, 24, 167, 176),
                                      Color.fromARGB(115, 24, 167, 176),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  minimumSize: Size(double.infinity,
                                      (screenHeight * 2.5 / 10 / 4)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    loadingLogIn = true;
                                  });
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () {
                                      setState(() {
                                        loadingLogIn = false;
                                      });
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const MainScreen();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: loadingLogIn
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Loading...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const Text(
                                        'Log In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const SignUpScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Color.fromARGB(215, 24, 167, 176),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
