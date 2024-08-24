import 'package:erp12k/screens/DetailsPage/ReturnsPage/return_detailed_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';

class MiniReturn extends StatelessWidget {
  const MiniReturn(
      {super.key,
      required this.returnDetailes,});

  final returnDetailes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => AppNavigation.push(
              context,
               ReturnDetailedPage(
                returnDetailes: returnDetailes,
              )),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.secondry,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text(returnDetailes['client_name']),
                Column(
                  children: [
                    Text(returnDetailes['id']),
                    Text(' الكميه : ${calcItemsCount(returnDetailes['items'])}'),
                  ],
                ),
                    Text(returnDetailes['date']),
              ],
            ),
          )),
    );
  }
}
calcItemsCount(List itemsList){
  int itemCount = 0 ;
  for (var i = 0; i < itemsList.length; i++) {
    int item = itemsList[i]['quantity'];
  itemCount +=item;
  }
  return itemCount;
}