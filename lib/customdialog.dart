// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.title,
      required this.callback,
      this.actionText = "Restart"})
      : super(key: key);
  final title;

  final VoidCallback callback;
  final actionText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.yellow[900],
      actions: [
        Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff332268)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: callback,
                child: Text(actionText)))
      ],
    );
  }
}
