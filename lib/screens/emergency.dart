
import 'package:flutter/material.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(200, 200, 0, 0),
        title: const Text('Emergency Screen'),
      ),
      body: const Center(
        child: Text('This is the Emergency screen content.'),
      ),
    );
  }
}