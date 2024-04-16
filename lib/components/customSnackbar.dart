import 'package:flutter/material.dart';

SnackBar customSnackBarWidget(String content,
    {Color backgroundColor = Colors.red}) {
  return SnackBar(
    content: Text(content, style: const TextStyle(color: Colors.white)),
    backgroundColor: backgroundColor,
  );
}
