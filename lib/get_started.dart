import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/Login/login_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: const Image(
                              image: AssetImage('images/logo.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GradientText(
                            'INCOGNITO',
                            colors: const [
                              Color.fromARGB(215, 24, 167, 176),
                              Color.fromARGB(115, 24, 167, 176),
                            ],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Image(
                                image: AssetImage('images/get_started.png')),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 38, bottom: 32),
                              child: const Text(
                                textAlign: TextAlign.center,
                                'HR - related tasks done with\nHR Management App',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et velit\ninterdum, ac aliquet odio mattis.',
                              style: TextStyle(
                                height: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(215, 24, 167, 176),
                              Color.fromARGB(215, 24, 167, 176),
                              //Color.fromARGB(115, 24, 167, 176),
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
                          // minimumSize: Size(double.infinity,
                          //     (screenHeight * 2.5 / 10 / 4)),
                        ),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              setState(() {
                                loading = false;
                              });
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const LoginScreen();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: loading
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
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
