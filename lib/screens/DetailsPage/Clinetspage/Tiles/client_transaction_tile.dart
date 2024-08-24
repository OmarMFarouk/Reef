import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientTransactionTile extends StatelessWidget {
  const ClientTransactionTile({
    super.key, required this.date, required this.way, required this.price,
  });
final String date;
final String way;
final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 60.h,
        // width: 10.w,
        decoration: BoxDecoration(
            color: AppColors.secondry,
            borderRadius: BorderRadius.circular(20)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date),
            Column(
              children: [
                Text(
                  price.toString(),
                  style: TextStyle(color: Colors.green),
                ),
                Text(way),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
