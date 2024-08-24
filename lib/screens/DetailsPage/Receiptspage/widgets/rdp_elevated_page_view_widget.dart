// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
// import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/client_transaction_tile.dart';
// import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/cutomer_detailed_page_elevated_button.dart';
// import 'package:erp12k/screens/DetailsPage/Clinetspage/pages/client_transactions_page.dart';
// import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/all_receipt_item.dart';
// import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_item.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class RDPElevatedPageViewWidget extends StatefulWidget {
//   const RDPElevatedPageViewWidget({
//     super.key,
//     required this.clientId,
//     required this.rId,
//   });
//   final String clientId;
//   final String rId;
//   @override
//   State<RDPElevatedPageViewWidget> createState() =>
//       _RDPElevatedPageViewWidgetState();
// }

// class _RDPElevatedPageViewWidgetState extends State<RDPElevatedPageViewWidget> {
//   int pageIndex = 2;

//   PageController pageController = PageController(initialPage: 2);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: SizedBox(
//             height: 35.h,
//             width: double.infinity,
//             child: ListView(
//               reverse: true,
//               scrollDirection: Axis.horizontal,
//               children: [
//                 DetailedPageElevatedButton(
//                   title: 'منتجات الفاتورة',
//                   ontap: () => pageController.animateToPage(2,
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.fastEaseInToSlowEaseOut),
//                   isSelected: pageIndex == 2 ? true : false,
//                 ),
//                 DetailedPageElevatedButton(
//                   title: 'مدفوعات',
//                   ontap: () => pageController.animateToPage(1,
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.fastEaseInToSlowEaseOut),
//                   isSelected: pageIndex == 1 ? true : false,
//                 ),
//                 DetailedPageElevatedButton(
//                   title: 'منتجات المرتجع',
//                   ontap: () => pageController.animateToPage(0,
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.fastEaseInToSlowEaseOut),
//                   isSelected: pageIndex == 0 ? true : false,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//             height: 300.h,
//             width: double.infinity,
//             child: PageView(
//               physics: const NeverScrollableScrollPhysics(),
//               onPageChanged: (index) {
//                 setState(() {
//                   pageIndex = index;
//                 });
//               },
//               controller: pageController,
//               children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16.0, vertical: 16),
//                               child: Column(
//                                 children: [
//                                   const Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('الاجمالي'),
//                                       SizedBox(width: 1),
//                                       Text('السعر'),
//                                       SizedBox(width: 40),
//                                       SizedBox(width: 1),
//                                       Text('المنتج'),
//                                       SizedBox(width: 17),
//                                       Text('الكمية'),
//                                     ],
//                                   ),
//                                   Divider(
//                                     thickness: 2,
//                                     color: AppColors.primary,
//                                   ),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: EdgeInsets.all(0.0),
//                                       child: StreamBuilder(
//                                           stream: MainCubit.get(context).getReceiptReturns(
//                                               clientId: widget.clientId, rId: widget.rId),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.hasData) {
//                                               QuerySnapshot data =
//                                                   snapshot.data as QuerySnapshot;
//                                               return ListView.builder(
//                                                 itemCount: data.docs.length,
//                                                 itemBuilder: (context, index) =>
//                                                     ReceiptItem(
//                                                   name: data.docs[index]['name'],
//                                                   price: data.docs[index]['price'],
//                                                   quantity: data.docs[index]['quantity'],
//                                                   // subtotal: data.docs[index]['subtotal'],
//                                                 ),
//                                               );
//                                             } else {
//                                               return Center(
//                                                 child: CircularProgressIndicator(),
//                                               );
//                                             }
//                                           }),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             StreamBuilder(
//                                 stream: MainCubit.get(context).getReceiptDof3a(
//                                     clientId: widget.clientId, rId: widget.rId),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasData) {
//                                     QuerySnapshot data = snapshot.data as QuerySnapshot;
//                                     return ListView.builder(
//                                       itemCount: data.docs.length,
//                                       itemBuilder: (context, index) =>
//                                           ClientTransactionTile(
//                                         date: data.docs[index]['date'].toString(),
//                                         price: data.docs[index]['price'],
//                                         way: data.docs[index]['way'],
//                                       ),
//                                     );
//                                   } else {
//                                     return Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   }
//                                 }),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16.0, vertical: 16),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text('الاجمالي'),
//                                       SizedBox(width: 20.w),
//                                       const Text('السعر'),
//                                       SizedBox(width: 70.w),
//                                       const Text('المنتج'),
//                                       SizedBox(width: 30.w),
//                                       const Text('الكمية'),
//                                     ],
//                                   ),
//                                   Divider(thickness: 2, color: AppColors.primary),
//                                   Expanded(
//                                     child: StreamBuilder(
//                                         stream: MainCubit.get(context).getReceipt(
//                                             clientId: widget.clientId, rId: widget.rId),
//                                         builder: (context, snapshot) {
//                                           if (snapshot.hasData) {
//                                             QuerySnapshot data =
//                                                 snapshot.data as QuerySnapshot;
//                                             return ListView.builder(
//                                               itemCount: data.docs.length,
//                                               itemBuilder: (context, index) => ReceiptItem(
//                                                 name: data.docs[index]['name'],
//                                                 price: data.docs[index]['price'],
//                                                 quantity: data.docs[index]['quantity'],
//                                                 // subtotal: data.docs[index]['subtotal'],
//                                               ),
//                                             );
//                                           } else {
//                                             return Center(
//                                               child: CircularProgressIndicator(),
//                                             );
//                                           }
//                                         }),
//                                   ),
//                                 ],
//                               ),
//                             ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
