import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/go_router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Future.microtask(() {
            if (snapshot.data != null) {
              context.pushReplacement(NamedRoute.NAV_BAR);
            } else {
              context.pushReplacement(NamedRoute.SIGNIN_PAGE);
            }
          });
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
