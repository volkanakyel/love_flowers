import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_flowers/blocs/auth_bloc.dart';
import 'package:love_flowers/screens/auth_screen.dart';
import 'package:love_flowers/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        } else if (state.status == AuthStatus.unauthenticated) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => AuthScreen()));
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
