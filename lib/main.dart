import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment_2/product_list_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList()
    );
  }
}



