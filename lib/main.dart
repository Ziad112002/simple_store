import 'package:cart_app/ui/screens/cart_screen.dart';
import 'package:cart_app/ui/screens/products_screen.dart';
import 'package:cart_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Scaffold(
    body:ProductsScreen(),
    ),
    );
  }
}


