import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final String title;
  const MyWidget({super.key, required this.title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title);
  }
}
