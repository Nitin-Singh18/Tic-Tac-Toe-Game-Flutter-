// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameButton {
  final id;
  late String text;
  late Color bgc;
  late bool enabled;

  GameButton(
      {this.id, this.text = "", this.bgc = Colors.grey, this.enabled = true});
}
