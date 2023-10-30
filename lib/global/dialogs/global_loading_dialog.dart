import 'package:flutter/material.dart';

class GlobalLoadingDialog extends StatelessWidget {

  final String title;
  final String? description;

  const GlobalLoadingDialog({
    required this.title,
    this.description,
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const CircularProgressIndicator(),

          const SizedBox(
            height: 50,
          ),

          if (description != null)
            Text(
              description!,
              textAlign: TextAlign.center,
            ),

        ],
      ),
    );
  }

}
