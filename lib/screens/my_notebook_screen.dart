import 'package:flutter/material.dart';

class MyNotebookScreen extends StatelessWidget {
  const MyNotebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notebook'),
      ),
      body: const Center(
        child: Text('This is the My Notebook screen.'),
      ),
    );
  }
}
