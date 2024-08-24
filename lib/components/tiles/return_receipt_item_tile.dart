import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnReceiptItem extends StatelessWidget {
  const ReturnReceiptItem({
    super.key, required this.num, required this.ontap,required this.title
  });
  final String title;
final int num;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                SizedBox(width: 70,child: Text(num.toString(),textDirection: TextDirection.rtl,)),
                const Text(''),
                SizedBox(width: 100.w,child:  Text(title,textDirection: TextDirection.rtl,)),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
