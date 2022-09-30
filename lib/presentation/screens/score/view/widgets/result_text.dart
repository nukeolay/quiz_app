import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String title;
  final String value;
  const ResultText({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$title: $value',
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
