import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  double borderRadius = 26;
  void dispode() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(215, 24, 167, 176),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Enter your Email and we will send you a password reset link',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'E-mail or Username',
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(215, 24, 167, 176),
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
                bottom: 18,
                top: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () => passwordReset(),
            // ignore: sort_child_properties_last
            child: const Text('Reset Password'),
            color: const Color.fromARGB(215, 24, 167, 176),
          ),
        ],
      ),
    );
  }
}
