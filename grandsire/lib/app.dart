import 'package:flutter/material.dart';
import 'package:grandsire/presentation/screens/sign_in.dart';
import 'package:grandsire/providers/google_signin.dart';
import 'package:provider/provider.dart';

class GrandSire extends StatelessWidget {
  const GrandSire({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(
      create: (_) => GoogleSignInProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
