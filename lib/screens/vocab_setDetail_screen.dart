import 'package:flutter/material.dart';

class VocabSetDetailScreen extends StatelessWidget {
  final String setId;
  final String title;

  const VocabSetDetailScreen({
    super.key,
    required this.title,
    required this.setId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Chi tiết cho bộ từ: $title',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
