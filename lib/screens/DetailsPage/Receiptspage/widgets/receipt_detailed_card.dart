import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';

class ReceiptDetailedCard extends StatelessWidget {
  ReceiptDetailedCard({
    super.key,
    required this.receiptId,
    required this.clientName,
    this.receiptDetailes,
    required this.isDone,
    required this.isPaid,
  });

  final receiptDetailes;
  final String receiptId;
  bool isDone;
  bool isPaid;
  final String clientName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.secondry, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SelectableText(
                  receiptId,
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          isDone ? Colors.green.shade300 : Colors.red.shade300),
                  child: Text(
                    isPaid
                        ? 'غير مدفوع'
                        : isDone
                            ? 'مدفوع كلي'
                            : 'مدفوع جزئي',
                    style: TextStyle(
                        color:
                            isDone == true ? Colors.black : Colors.red.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  clientName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // const Text(
                //   'mo.samad2016@gmail.com',
                //   style: TextStyle(
                //       fontSize: 15, color: Colors.black45),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
