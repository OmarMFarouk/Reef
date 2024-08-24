import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/all_receipt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Receipt extends StatelessWidget {
  const Receipt({
    super.key,
    required this.isDone,
  });

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 100.h,
        // width: 300.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Text(
              '******************************************************************',
              maxLines: 1,
            ),
            const Text('#A12345'),
            const Text(
              '*****************************************************************',
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color:
                          isDone ? Colors.green.shade300 : Colors.red.shade300),
                  child: Text(
                    isDone ? 'تم الدفع' : 'قيد الدفع',
                    style: TextStyle(
                        color: isDone
                            ? Colors.green.shade900
                            : Colors.red.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text('09-10-2018'),
                const Text('10:49 AM'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100.h,
                child: const AllReceiptItem(),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  ' : اجمالي السعر',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  '\$20000',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                const Text(
                  ' : الخصم',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$12000', style: TextStyle(color: Colors.blue.shade800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                const Text(
                  ' : اجمالي المدفوع',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$15000', style: TextStyle(color: Colors.green.shade800)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                const Text(
                  ' : المتبقي',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$5000', style: TextStyle(color: Colors.red.shade800)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
