import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDrawerTile extends StatelessWidget {
  const TransactionDrawerTile({
    super.key, required this.isIn,
  });
final bool isIn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60.h,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(
              color:  isIn? Colors.green.shade200 : Colors.red.shade200,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(20),
            color: isIn? Colors.green.shade200 : Colors.red.shade200
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.values[5],
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
            ),
             Text(
             isIn?  'طلب تحويلات\n من المخزن'
             :
             'طلب تحويلات\n من العربه',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
