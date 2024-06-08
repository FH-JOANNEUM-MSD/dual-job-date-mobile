import 'package:flutter/material.dart';

SnackBar customSnackBarWidget(String content, {bool isSuccess = false, int? durationInSeconds}) {
  final defaultDuration = 4;
  return SnackBar(
    content: Text(content, style: const TextStyle(color: Colors.white)),
    // TODO: Color is too bright
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    duration: durationInSeconds != null ? Duration(seconds: durationInSeconds) : Duration(seconds: defaultDuration),
  );
}
