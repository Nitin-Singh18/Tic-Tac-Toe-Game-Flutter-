import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.callback,
      this.actionText = "Restart"})
      : super(key: key);
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      backgroundColor: Colors.white,
      actions: [
        Center(
            child: ElevatedButton(onPressed: callback, child: Text(actionText)))
      ],
    );
  }
}
