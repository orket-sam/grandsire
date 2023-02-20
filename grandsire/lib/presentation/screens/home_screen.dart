import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grandsire/providers/google_signin.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              Widget widget;
              if (snapshot.hasData) {
                widget = Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                widget = const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 0.7,
                  ),
                );
              } else {
                widget = const SignUpWidget();
              }
              return widget;
            }),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.watch<GoogleSignInProvider>().user.email),
    );
  }
}
