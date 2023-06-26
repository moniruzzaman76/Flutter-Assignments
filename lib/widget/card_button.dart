import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {

  final VoidCallback onPressed;
  final int count;

  const CounterButton(
      {super.key, required this.onPressed, required this.count});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.count.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 35,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            child: const Text("Buy Now"),
          ),
        ),
      ],
    );
  }
}