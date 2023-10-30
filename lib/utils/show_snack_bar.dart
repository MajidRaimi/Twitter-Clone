

import 'package:flutter/material.dart';

void showSnackBar ({
  required BuildContext context,
  String? message
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message ?? 'Error occurred'),
    ),
  );
}