import 'package:flutter/material.dart';

class BooksCompletePage extends StatelessWidget {
  const BooksCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen,
        child: const Center(
          child: Text("Complete Books"),
        ),
      ),
    );
  }
}
