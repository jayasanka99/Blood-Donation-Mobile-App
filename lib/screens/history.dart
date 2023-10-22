import 'package:flutter/material.dart';

class HISTORY extends StatelessWidget {
  const HISTORY({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(200, 200, 0, 0),
          title: Text("HISTORY"),
        ),
      ),
    );
  }
}
