import 'package:flutter/material.dart';

class ScoreSavedMessage extends StatelessWidget {
  const ScoreSavedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.done,
              size: 90,
              color: Colors.indigo,
            ),
            Text(
              'Result Saved!',
              style: TextStyle(color: Colors.indigo, fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
