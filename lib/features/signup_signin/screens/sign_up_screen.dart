import 'package:c_b_c_online/features/signup_signin/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign_up_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _signupFormKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //const SizedBox(height: 24),
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SocialButton(socialName: "facebook"),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 154, 72, 235),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/pngs/google_icon.png",
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text("Google")
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
