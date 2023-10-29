import 'package:flutter/material.dart';

class GlobalErrorDialog extends StatelessWidget {

  final String title;
  final Widget content;

  const GlobalErrorDialog({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(50),
      title: Center(
        child: Text(
          title,
        ),
      ),
      content: content,
    );
  }

}
