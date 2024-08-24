// ignore_for_file: file_names

import 'package:erp12k/components/tiles/item.dart';
import 'package:flutter/material.dart';

class ItemX extends StatelessWidget {
  const ItemX({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Item(),
        ElevatedButton.icon(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red),
          ),
          onPressed: () {},
          label: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
