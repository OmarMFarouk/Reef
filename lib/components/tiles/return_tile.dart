import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnTile extends StatelessWidget {
  const ReturnTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(26)),
        child: Row(
          children: [
            Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.camera_alt)),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Return',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('Diet Cockies', style: AppFonts.black),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(' : سبب الترجيع',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('انتهاء الصلاحيه'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(' : تاريخ الترجيع',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('12-20-2019'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(' : وقت الاستلام',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('10:00 AM'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(' : الحل المتخذ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('تبديل المنتج'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
