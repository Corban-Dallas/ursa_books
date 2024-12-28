import 'package:flutter/material.dart';

class AudioBooksCompletePage extends StatelessWidget {
  const AudioBooksCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: const Center(
          child: Text("Complete Audiobooks"),
        ),
      ),
    );
  }
}
