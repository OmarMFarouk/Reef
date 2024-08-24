import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.color,
    required this.icon,
    required this.ontap,
  });
  final Color color;
  final Icon icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(0, 50)),
            backgroundColor: WidgetStatePropertyAll(color),
            iconColor: const WidgetStatePropertyAll(Colors.white),
            shape: const WidgetStatePropertyAll(CircleBorder(eccentricity: 0))),
        child: icon,
      ),
    );
  }
}
