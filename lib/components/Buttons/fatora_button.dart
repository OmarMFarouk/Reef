import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FatoraButton extends StatelessWidget {
  const FatoraButton({
    super.key,
    required this.title,
    required this.color,
    required this.ontap,
  });
  final String title;
  final Color color;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
              backgroundColor: WidgetStatePropertyAll(color)),
          onPressed: ontap,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
    );
  }
}
