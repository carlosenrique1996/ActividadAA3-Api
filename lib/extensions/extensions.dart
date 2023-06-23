import 'package:flutter/material.dart';

extension SizedBoxGeneratedByNum on num {
  Widget get eh => SizedBox(
        //espacio o paddig horizontal
        width: toDouble(),
      );
  Widget get ev => SizedBox(
        //espacio o paddig vertical
        height: toDouble(),
      );
}

extension DateTimeExtensions on DateTime {
  DateTime get date => DateTime(year, month, day);
}
