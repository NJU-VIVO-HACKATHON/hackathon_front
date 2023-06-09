import 'package:flutter/material.dart';

Future<void> showBasicFlash(
  BuildContext context,
  Widget content, {
  Duration? duration,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: content,
    ),
    shape: Border.all(color: Colors.grey),
    backgroundColor: Colors.white,
    duration: duration ?? const Duration(seconds: 3),
  ));
}
