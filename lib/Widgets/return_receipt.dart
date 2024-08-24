// import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
// import 'package:erp12k/screens/DetailsPage/ReturnsPage/return_detailed_page.dart';
// import 'package:erp12k/src/app_navigation.dart';
// import 'package:flutter/material.dart';

// class ReturnReceipt extends StatelessWidget {
//   const ReturnReceipt({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         onTap: ()=> AppNavigation.push(context,const ReturnDetailedPage()),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           // height: 100.h,
//           // width: 300.w,
//           decoration: BoxDecoration(
//             color: Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child:  Column(
//             children: [
//               const Text(
//                 '**********************************************************************',
//                 maxLines: 1,
//               ),
//               const Text('#R12345'),
//               const Text(
//                 '*********************************************************************',
//                 maxLines: 1,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text('09-10-2018'),
//                   Text('10:49 AM'),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ReturnReceiptItem(num: 1,ontap: (){},title: '',),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Row(
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Text(' : سبب الترجيع',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('انتهاء الصلاحيه'),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Row(
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Text(' : تاريخ الترجيع',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('12-20-2019'),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Row(
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Text(' : وقت الاستلام',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('10:00 AM'),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Row(
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Text(' : الحل المتخذ',
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('تبديل المنتج'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
