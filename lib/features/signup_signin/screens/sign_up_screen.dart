import 'package:c_b_c_online/features/signup_signin/widgets/social_buttons.dart';
import 'package:c_b_c_online/features/signup_signin/widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = "/sign_up_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _signupFormKey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //const SizedBox(height: 24),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SocialButton(socialName: "facebook"),
                  SocialButton(socialName: "google"),
                ],
              ),
              const SizedBox(
                height: 36,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const TextFieldsDecoration(
                      inputHintText: "Username", inputIcon: Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Username";
                    } else if (value.contains(' ')) {
                      return 'Username cannot contains spaces';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const TextFieldsDecoration(
                      inputHintText: "Email", inputIcon: Icons.email_outlined),
                ),
              ),

              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const TextFieldsDecoration(
                      inputHintText: "Password", inputIcon: Icons.lock),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: const TextFieldsDecoration(
                      inputHintText: "Confirm Password", inputIcon: Icons.lock),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      if (_signupFormKey.currentState!.validate()) {
                        print("create account");
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Create Account"),
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Or",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already have an account? "),
                  Text(
                    "Log in",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
