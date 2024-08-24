import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainsubcont extends StatelessWidget {
  const Mainsubcont({
    super.key,
    required this.subnum,
    required this.subtext,
    required this.subicon,
    required this.ontap,
    required this.color,
  });
  final int subnum;
  final String subtext;
  final IconData subicon;
  final VoidCallback ontap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: ontap,
        child: Container(
          height: 70.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: color.withAlpha(100),
              // border: Border.all(color: color, width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                subicon,
                size: 40,
                color: color,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$subnum',
                    style: AppFonts.prim,
                  ),
                  Text(subtext,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
