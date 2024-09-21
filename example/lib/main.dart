import 'package:flutter/material.dart';
import 'package:magic_extensions/magic_extensions.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            "Hello".toText(),
          ],
        ).center(),
      ),
    );
  }
}
