import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
import 'package:flutter/material.dart';

class AllReturnReceiptItems extends StatelessWidget {
  const AllReturnReceiptItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ReturnReceiptItem(num: 20, ontap: () {},title: '',),
    );
  }
}

class AllReturnReceiptItemsEdit extends StatelessWidget {
  const AllReturnReceiptItemsEdit({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ReturnReceiptItem(num: 20, ontap: ontap,title: '',),
    );
  }
}
