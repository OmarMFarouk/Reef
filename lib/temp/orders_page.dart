// import 'package:erp12k/components/OrdersPageComponents/custom_text_field.dart';
// import 'package:erp12k/components/Buttons/fatora_button.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:erp12k/src/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../components/tiles/itemX.dart';

// class OrdersPage extends StatelessWidget {
//   const OrdersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primary,
//       ),
//       body: ListView(
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           const Column(
//             children: [
//               CustomTextField(title: 'Customer'),
//               CustomTextField(title: 'Date Created'),
//               CustomTextField(title: 'Order delivery\n date'),
//               CustomTextField(title: 'Recept Date'),
//               CustomTextField(title: 'Location'),
//               CustomTextField(title: 'Order State', isState: true),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text('Products List', style: AppFonts.black),
//               Text('Total Quantity:  18', style: AppFonts.black),
//             ],
//           ),
//           SizedBox(
//             height: 190.h,
//             child: ListView.builder(
//               // itemCount: 3,
//               itemBuilder: (context, index) => const ItemX(),
//             ),
//           ),
//           FatoraButton(
//             color: Colors.deepOrange,
//             title: 'fatora',
//             ontap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
