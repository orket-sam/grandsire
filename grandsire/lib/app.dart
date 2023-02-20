import 'package:flutter/material.dart';
import 'package:grandsire/presentation/screens/sign_in.dart';

class GrandSire extends StatelessWidget {
  const GrandSire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
