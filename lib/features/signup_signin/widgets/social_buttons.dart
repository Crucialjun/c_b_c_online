import 'package:c_b_c_online/global_utils/extensions.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String socialName;
  const SocialButton({super.key, required this.socialName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor:
                socialName == 'facebook' ? Colors.blue : Colors.purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/pngs/${socialName}_icon.png",
                width: 32,
                height: 32,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(socialName.capitalizeFirstLetter())
            ],
          ),
        ));
  }
}
