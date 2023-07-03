import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
  final int? maxLine;
  final String validatorText;

  const CustomTextField({super.key, required this.hinText,
    required this.controller, this.maxLine, required this.validatorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if( value==null || value.isEmpty){
          return validatorText;
        }
        return null;
      },
      maxLines: maxLine ?? 1,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color:Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:Colors.green),
        ),
      ),

    );
  }
}