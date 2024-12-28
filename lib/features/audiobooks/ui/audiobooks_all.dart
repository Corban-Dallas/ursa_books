import 'package:flutter/material.dart';

class AudioBooksPage extends StatelessWidget {
  const AudioBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: const Center(
          child: Text("Audiobooks"),
        ),
      ),
    );
  }
}
