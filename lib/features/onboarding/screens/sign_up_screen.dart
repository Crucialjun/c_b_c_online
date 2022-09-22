import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign_up_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/pngs/facebook_icon.png",
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("Facebook")
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/pngs/facebook_icon.png",
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("Facebook")
                    ],
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
