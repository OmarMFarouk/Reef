// import 'package:erp12k/Widgets/receipt.dart';
// import 'package:erp12k/components/Buttons/fatora_button.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:flutter/material.dart';

// class ReceiptConfirmPage extends StatelessWidget {
//   const ReceiptConfirmPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColors.primary,
//         title:
//             SizedBox(height: 90, child: Image.asset('assets/images/logo.jpg')),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           const Receipt(isDone: true),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: FatoraButton(
//                 title: 'تاكيد',
//                 color: Colors.black,
//                 ontap: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Receipt Success'),
//                       duration: Duration(milliseconds: 700),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                   // AppNavigation.pop(context);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: FatoraButton(
//                 title: 'الغاء',
//                 color: Colors.red,
//                 ontap: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Receipt Canceled'),
//                       duration: Duration(milliseconds: 700),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                   // AppNavigation.pop(context);
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
