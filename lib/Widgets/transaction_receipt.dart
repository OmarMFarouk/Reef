import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionReceipt extends StatelessWidget {
  const TransactionReceipt({
    super.key,
    required this.isWareConfirmed,
    required this.isEmpConfirmed,
  });
  final bool isWareConfirmed;
  final bool isEmpConfirmed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 100.h,
        // width: 300.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Text(
              '**********************************************************************',
              maxLines: 1,
            ),
            const Text('#T12345'),
            const Text(
              '*********************************************************************',
              maxLines: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('09-10-2018'),
                Text('10:49 AM'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReturnReceiptItem(
                num: 1,
                ontap: () {},title: '',
              ),
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(' : رقم المخزن',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' : تاكيد مشرف المخزن',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text(' : تاكيد الموظف',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(' : قيمة الفاتورة',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('W19'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: isWareConfirmed
                              ? Colors.green.shade300
                              : Colors.red.shade300),
                      child: Text(
                        isWareConfirmed ? 'تم التاكيد' : 'لم يتم التاكيد',
                        style: TextStyle(
                            color: isWareConfirmed
                                ? Colors.green.shade900
                                : Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: isEmpConfirmed
                              ? Colors.green.shade300
                              : Colors.red.shade300),
                      child: Text(
                        isEmpConfirmed ? 'تم التاكيد' : 'لم يتم التاكيد',
                        style: TextStyle(
                            color: isEmpConfirmed
                                ? Colors.green.shade900
                                : Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('12000'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
