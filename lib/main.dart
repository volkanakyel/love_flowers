import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_flowers/blocs/auth_bloc.dart';
import 'package:love_flowers/blocs/connection_bloc.dart';
import 'package:love_flowers/blocs/flower_bloc.dart';
import 'package:love_flowers/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<ConnectionBloc>(create: (context) => ConnectionBloc()),
        BlocProvider<FlowerBloc>(create: (context) => FlowerBloc()),
      ],
      child: MaterialApp(
        title: 'Love Flowers',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
