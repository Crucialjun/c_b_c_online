import 'package:flutter/material.dart';

class MainDashboard extends StatelessWidget {
  static const routeName = "/main_dashboard_screen";
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Dashboard")),
    );
  }
}
