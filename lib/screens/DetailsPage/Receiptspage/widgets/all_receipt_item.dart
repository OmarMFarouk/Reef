import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_item.dart';
import 'package:flutter/material.dart';

class AllReceiptItem extends StatelessWidget {
  const AllReceiptItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Mrawan.names.length,
      itemBuilder: (context, index) => ReceiptItem(name:'error' ,price: 0,quantity: 0,),
    );
  }
}

class AllReceiptItemEdit extends StatelessWidget {
  const AllReceiptItemEdit({super.key, required this.ontap});
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Mrawan.names.length,
      itemBuilder: (context, index) => ReceiptItem(name:'error' ,price: 0,quantity: 0,ontap: ontap,),
    );
  }
}


class Mrawan {
  static List<String> names = [
    'كولا دايت',
    'كاب كيك',
    'برجر دايت',
    'عيش دايت',
    'منتج طويل جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا جدا',
    'منتج عادي',
  ];
  static List<String> price = [
    '12',
    '120000',
    '4567',
    '4567',
    '1299',
    '102',
  ];
}

