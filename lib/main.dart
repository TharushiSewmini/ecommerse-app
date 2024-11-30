import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/pages/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/pages/landing/ui/landing_page.dart';
import 'package:ecommerce_app/pages/login/bloc/auth_bloc.dart';
import 'package:ecommerce_app/pages/login/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()..add(HomeInitialEvent(""))),
    BlocProvider<CartBloc>(
        create: (context) => CartBloc()..add(CartInitialEvent())),
    BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(AuthInitialEvent())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.black,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
