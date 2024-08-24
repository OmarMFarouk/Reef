import 'package:erp12k/screens/DetailsPage/Transactionpage/transaction_detailed_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';

class MiniTransaction extends StatelessWidget {
  MiniTransaction({
    super.key, required this.data,
  });
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () =>
              AppNavigation.push(context, TransactionDetailedPage(data: data,)),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.secondry,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(data['from_id']),
                        Text(
                          '  من',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(data['to_id']),
                        Text(
                          '  الي',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(data['id']),
                    Text(data['statues'],),
                  ],
                ),
                Text( calcQuantity(
                                    data['items'],
                                  ).toString(),),
              ],
            ),
          )),
    );
  }
}
calcQuantity(List items) {
  int count = 0;
  for (var i = 0; i < items.length; i++) {
    count = count + int.parse(items[i]['quantity'].toString());
  }
  return count;
}
