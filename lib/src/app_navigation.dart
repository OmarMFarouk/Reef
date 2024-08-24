import 'package:flutter/material.dart';

class AppNavigation {
  static void pop(context) => Navigator.pop(context);
  static void push(context, page) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
  static void pushR(context, page) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}
