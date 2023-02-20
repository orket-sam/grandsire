import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grandsire/presentation/screens/home_screen.dart';
import 'package:grandsire/providers/google_signin.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Hey there,\nWelcome to \nGrandsire',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.black26)),
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(StadiumBorder())),
                onPressed: () {
                  context.read<GoogleSignInProvider>().googleLogin().then(
                      (value) => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen())));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Continue with Google'),
                  ],
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.black26)),
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(StadiumBorder())),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Text('Sign out'),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
