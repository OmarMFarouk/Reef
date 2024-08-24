import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';

class OptionsTile extends StatelessWidget {
  const OptionsTile({super.key, required this.title, required this.ontap});
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        decoration:
            BoxDecoration(color: AppColors.primary, border: Border.all()),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
