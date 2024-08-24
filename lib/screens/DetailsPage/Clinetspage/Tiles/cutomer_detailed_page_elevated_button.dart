import 'package:flutter/material.dart';

class DetailedPageElevatedButton extends StatelessWidget {
  const DetailedPageElevatedButton(
      {super.key,
      required this.title,
      required this.ontap,
      required this.isSelected});
  final String title;
  // final VoidCallback ontap;
  final bool isSelected;
  final VoidCallback ontap;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1),
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                isSelected ? Colors.black : Colors.white)),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
