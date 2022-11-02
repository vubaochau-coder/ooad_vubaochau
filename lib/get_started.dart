import 'package:flutter/material.dart';
import 'package:ooad_vubaochau/login.dart';

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
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: const Image(
                            image: AssetImage('images/get_started.png')),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'HR - related tasks done with\nHR Management App',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nunc vulputate libero et velit\ninterdum, ac aliquet odio mattis.',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
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
                                // minimumSize: Size(double.infinity,
                                //     (screenHeight * 2.5 / 10 / 4)),
                              ),
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                Future.delayed(
                                  const Duration(seconds: 3),
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
                                      'Get Started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
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
