import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, this.text = 'Error occurred while processing'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.text = 'Error occurred while processing'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(text: text),
    );
  }
}
