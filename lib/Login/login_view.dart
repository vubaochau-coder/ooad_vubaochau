import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ooad_vubaochau/Login/abstract_login_view.dart';
import 'package:ooad_vubaochau/Login/login_presenter.dart';
import 'package:ooad_vubaochau/main_screen.dart';
import 'package:ooad_vubaochau/signup.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  bool isNotShowPass = true;
  double borderRadius = 26;
  bool loadingLogIn = false;
  bool isClickedLoginBtn = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late LoginPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double statusbarHeight = MediaQuery.of(context).padding.top;
    double bottomHeight = MediaQuery.of(context).padding.bottom;
    double height = screenHeight - statusbarHeight - bottomHeight;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: (height - 30) * 6 / 7,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ((height - 30) * 6 / 7) * 3 / 11,
                        width: double.infinity,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          child: GradientText(
                            'EMA',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 68,
                              letterSpacing: 4,
                            ),
                            colors: const [
                              Color.fromARGB(215, 24, 167, 176),
                              Color.fromARGB(115, 24, 167, 176),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ((height - 30) * 6 / 7) * 8 / 11,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: (((height - 30) * 6 / 7) * 8 / 11) / 14,
                              width: double.infinity,
                              child: const Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  (((height - 30) * 6 / 7) * 8 / 11) * 7 / 14,
                              width: double.infinity,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  bottom: 24,
                                  top: 24,
                                ),
                                child: const Image(
                                  image: AssetImage('images/login.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  (((height - 30) * 6 / 7) * 8 / 11) * 6 / 14,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height:
                                        ((((height - 30) * 6 / 7) * 8 / 11) *
                                                6 /
                                                14) *
                                            5 /
                                            8,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextField(
                                          controller: emailController,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: 'E-mail or Username',
                                            prefixIcon: const Icon(
                                              Icons.person,
                                              color: Color.fromARGB(
                                                  215, 24, 167, 176),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    215, 24, 167, 176),
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    215, 24, 167, 176),
                                                width: 2,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                              left: borderRadius - 2,
                                              right: borderRadius - 2,
                                              bottom: 18,
                                              top: 18,
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: passController,
                                          obscureText: isNotShowPass,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            prefixIcon: const Icon(
                                              Icons.vpn_key,
                                              color: Color.fromARGB(
                                                  215, 24, 167, 176),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    215, 24, 167, 176),
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    215, 24, 167, 176),
                                                width: 2,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                              left: borderRadius,
                                              right: borderRadius,
                                              bottom: 18,
                                              top: 18,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(isNotShowPass
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              color: const Color.fromARGB(
                                                  215, 24, 167, 176),
                                              onPressed: () {
                                                setState(() {
                                                  isNotShowPass =
                                                      !isNotShowPass;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ((((height - 30) * 6 / 7) * 8 / 11) *
                                                6 /
                                                14) *
                                            3 /
                                            8,
                                    width: double.infinity,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      child: TextButton(
                                        onPressed: null,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ForgotPasswordPage();
                                                },
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  215, 24, 167, 176),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                SizedBox(
                  height: (height - 30) / 7,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(215, 24, 167, 176),
                                Color.fromARGB(215, 24, 167, 176),
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
                            minimumSize: Size(
                                double.infinity, (screenHeight * 2.5 / 10 / 4)),
                          ),
                          onPressed: !isClickedLoginBtn
                              ? () {
                                  setState(() {
                                    loadingLogIn = true;
                                  });
                                  isClickedLoginBtn = true;
                                  presenter.login(emailController.text,
                                      passController.text);
                                }
                              : null,
                          child: loadingLogIn
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
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
        ),
      ),
    );
  }

  @override
  void onLoginSuccess() {
    if (mounted) {
      setState(() {
        loadingLogIn = false;
      });
    }
    Fluttertoast.showToast(
      msg: 'Login successfully',
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return const MainScreen();
      },
    ));
  }

  @override
  void onLoginError(int errorCode, String message) {
    setState(() {
      loadingLogIn = false;
      isClickedLoginBtn = false;
    });

    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
