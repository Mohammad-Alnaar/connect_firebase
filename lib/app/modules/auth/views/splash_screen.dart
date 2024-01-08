import 'package:connect_firebase/app/core/extensions/buid_context_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.amber,
            height: context.screenHeight * 0.3,
            width: context.screenWidth * 0.2,
            child: Center(child: Text("Connect"))),
      ),
    );
  }
}
