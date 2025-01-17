import 'package:flutter/material.dart';

class ArgumentScreen extends StatelessWidget {
  const ArgumentScreen({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
