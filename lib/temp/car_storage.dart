// import 'package:erp12k/components/tiles/product.dart';
// import 'package:erp12k/screens/CreatesPage/transaction_create_page.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:erp12k/src/app_navigation.dart';
// import 'package:flutter/material.dart';

// class CarStorage extends StatelessWidget {
//   const CarStorage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: AppColors.primary,
//           title: SizedBox(
//               height: 90, child: Image.asset('assets/images/logo.jpg')),
//         ),
//         body: Column(
//           children: [
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '200 : عدد المنتجات في السيارة',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Expanded(
//                 child: ListView.builder(
//               itemBuilder: (context, index) => Product(
//                 ontap: () {},
//               ),
//               itemCount: 100,
//             ))
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () =>
//               AppNavigation.push(context, const TransactionCreatePage()),
//           backgroundColor: AppColors.primary,
//           shape: const CircleBorder(),
//           child: const Icon(Icons.add),
//         ));
//   }
// }
