import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}


