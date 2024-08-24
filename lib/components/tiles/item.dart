import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 50.h,
        width: 260.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pepsi',
              style: AppFonts.black,
            ),
            Text(
              '5',
              style: AppFonts.black,
            ),
            Image.asset('assets/images/pepsi.jpg')
          ],
        ),
      ),
    );
  }
}
