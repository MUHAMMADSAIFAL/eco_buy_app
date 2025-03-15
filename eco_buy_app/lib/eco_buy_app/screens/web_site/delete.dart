import 'package:flutter/material.dart';

class Delete extends StatelessWidget {
  static const String id = "Delete";

  const Delete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Delete"),
      ),
    );
  }
}
