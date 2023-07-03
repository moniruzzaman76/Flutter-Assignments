import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const CustomButton({
    super.key, required this.text, required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
          ),
          onPressed: onTab,
          child: Text(text,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),)),
    );
  }
}
