import 'package:erp12k/screens/DetailsPage/Receiptspage/receipt_detailed_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';

class MiniReceipt extends StatelessWidget {
  const MiniReceipt({
    super.key,
    required this.clientName,
    required this.receiptid,
    required this.rId,
    required this.price,
    required this.clientId,
    required this.receiptDetailes,
  });
  final String clientName;
  final String receiptid;
  final String rId;
  final String clientId;
  final  price;
  final receiptDetailes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => AppNavigation.push(
              context,
              ReceiptDetailedPage(
                  clientId: clientId,
                 receiptId: rId,
                  clientName: clientName)),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.secondry,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 60,
                  child: Text(clientName,textDirection: TextDirection.rtl,)),
                Column(
                  children: [
                    Text(receiptid),
                    Text(receiptDetailes['remained'] ==0
                               
                        ? 'مدفوع كلي'
                        : receiptDetailes['paid']==0? 'غير مدفوع': 'مدفوع جزئي'),
                  ],
                ),
                SizedBox(width: 50,
                  child: 
                  Text(price.toString())
                // Text('999999'),
                  ),
              ],
            ),
          )),
    );
  }
}
