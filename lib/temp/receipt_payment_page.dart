// import 'package:erp12k/components/Buttons/fatora_button.dart';
// import 'package:erp12k/components/OrdersPageComponents/custom_text_field.dart';
// import 'receipt_confirm_page.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:erp12k/src/app_navigation.dart';
// import 'package:erp12k/src/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// // ignore: must_be_immutable
// class ReceiptPaymentPage extends StatelessWidget {
//   ReceiptPaymentPage({super.key});
//   bool isNotPaid = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: AppColors.primary,
//           title: SizedBox(
//               height: 90, child: Image.asset('assets/images/logo.jpg')),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 '#A12345',
//                 style: AppFonts.black,
//               ),
//               const Row(
//                 textDirection: TextDirection.rtl,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         ' : الاسم',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                       Text(
//                         ' : الحاله',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                       Text(
//                         ' : الموقع',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         'محمد بتنجانة',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       Text(
//                         "تم التسليم",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       Text(
//                         'منطقه شبرا شارع 20',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               // Padding(
//               //   padding: const EdgeInsets.all(10.0),
//               //   child: DropdownButtonFormField(
//               //     decoration: InputDecoration(
//               //       border: OutlineInputBorder(
//               //           borderRadius: BorderRadius.circular(16)),
//               //       labelText: 'طريقة الدفع',
//               //       contentPadding: const EdgeInsets.all(20),
//               //     ),
//               //     // value: 'test',
//               //     items: const [
//               //       DropdownMenuItem(
//               //         value: 'one',
//               //         child: Text('مدفوع الكامل'),
//               //       ),
//               //       DropdownMenuItem(
//               //         value: 'two',
//               //         child: Text('مدفوع جزئي'),
//               //       ),
//               //       DropdownMenuItem(
//               //         value: 'three',
//               //         child: Text('مؤجل'),
//               //       ),
//               //     ],
//               //     onChanged: (value) {},
//               //   ),
//               // ),
//               // will be predited
//               const CustomTextField(
//                 title: 'المبلغ المدفوع',
//                 keyboardType: TextInputType.number,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Text(
//                           ' : اجمالي السعر',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Text(
//                           '\$32000',
//                           style: TextStyle(
//                               color: Colors.red,
//                               decoration: TextDecoration.lineThrough,
//                               fontSize: 20),
//                         ),
//                         Text(
//                           '\$20000',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         const Text(
//                           ' : الخصم',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text('\$12000',
//                             style: TextStyle(color: Colors.blue.shade800)),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         const Text(
//                           ' : اجمالي المدفوع',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text('\$0',
//                             style: TextStyle(color: Colors.green.shade800)),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         const Text(
//                           ' : المتبقي',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text('\$20000',
//                             style: TextStyle(color: Colors.red.shade800)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 50.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: FatoraButton(
//                     title: 'التالي',
//                     color: Colors.black,
//                     ontap: () => AppNavigation.push(
//                         context, const ReceiptConfirmPage())),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: FatoraButton(
//                     title: 'الغاء',
//                     color: Colors.red,
//                     ontap: () => AppNavigation.pop(context)),
//               ),
//             ],
//           ),
//         ));
//   }
// }
