import 'package:flutter/material.dart';

class CardPageScreen extends StatefulWidget {
  final int totalProduct;
  const CardPageScreen({Key? key, required this.totalProduct})
      : super(key: key);

  @override
  State<CardPageScreen> createState() => _CardPageScreenState();
}

class _CardPageScreenState extends State<CardPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Card"),
      ),
      body: Center(
        child: Text(
          "Total product: ${widget.totalProduct}",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
