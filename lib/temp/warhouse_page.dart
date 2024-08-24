// import 'package:erp12k/components/HomePageComponents/sub_cont.dart';
// import 'package:erp12k/components/tiles/item.dart';
// import 'package:erp12k/components/tiles/transaction_drawer_tile.dart';
// import 'package:erp12k/components/temp/orders_page.dart';
// import 'package:erp12k/screens/Pages/products_page.dart';
// import 'package:erp12k/screens/Pages/transaction_page.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:erp12k/src/app_navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class WarhousePage extends StatelessWidget {
//   const WarhousePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: Padding(
//         padding: const EdgeInsets.only(top: kToolbarHeight),
//         child: Drawer(
//           child: Column(
//             children: [
//               const Center(
//                 child: Text('طلبات التحويل', style: TextStyle(fontSize: 30)),
//               ),
//               Expanded(
//                 child: ListView(
//                   children: const [
//                     TransactionDrawerTile(
//                       isIn: true,
//                     ),
//                     TransactionDrawerTile(
//                       isIn: false,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: AppColors.primary,
//         centerTitle: true,
//         title: SizedBox(
//           height: 90,
//           child: Image.asset('assets/images/logo.jpg'),
//         ),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 250.h,
//             width: double.infinity,
//             // 1st row sub_cont
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Mainsubcont(
//                       color: Colors.red,
//                       ontap: () {
//                         AppNavigation.push(context, const OrdersPage());
//                       },
//                       subnum: 1,
//                       subtext: 'التقارير',
//                       subicon: Icons.moving_outlined,
//                     ),
//                     Mainsubcont(
//                       color: Colors.blue,
//                       ontap: () =>
//                           AppNavigation.push(context, const TransactionPage()),
//                       subnum: 4,
//                       subtext: 'التحويلات',
//                       subicon: Icons.compare_arrows_outlined,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Mainsubcont(
//                       color: Colors.green,
//                       ontap: () =>
//                           AppNavigation.push(context, const WarhousePage()),
//                       subnum: 100,
//                       subtext: 'مخزني',
//                       subicon: Icons.shopping_cart,
//                     ),
//                     Mainsubcont(
//                       color: Colors.orange,
//                       ontap: () =>
//                           AppNavigation.push(context, const ProductsPage()),
//                       subnum: 271,
//                       subtext: 'المنتجات',
//                       subicon: Icons.format_list_numbered_sharp,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // const Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //   children: [
//           //     Text('1200 : اجمالي السعر',
//           //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           //     Text('40 : منتجات العربيه',
//           //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           //   ],
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.all(16.0),
//           //   child: Container(
//           //     height: 200.h,
//           //     width: 200.w,
//           //     decoration: BoxDecoration(
//           //         // color: AppColors.primary.withAlpha(100),
//           //         // border: Border.all(color: AppColors.primary, width: 4),
//           //         borderRadius: BorderRadius.circular(20)),
//           //     child: Expanded(
//           //       child: ListView.builder(
//           //         itemCount: 40,
//           //         itemBuilder: (context, index) => const Item(),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ElevatedButton(
//                     //fadl
//                     onPressed: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) {
//                           return Column(
//                             children: [
//                               const Text(
//                                 '40 : الفاضل',
//                                 style: TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.bold),
//                               ),
//                               Expanded(
//                                   child: ListView.builder(
//                                 itemCount: 40,
//                                 itemBuilder: (context, index) => const Item(),
//                               )),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     style: ButtonStyle(
//                         backgroundColor:
//                             WidgetStatePropertyAll(Colors.green.shade600)),
//                     child: const Text(
//                       'الفاضل',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ElevatedButton(
//                     //tal3
//                     onPressed: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) {
//                           return Column(
//                             children: [
//                               const Text(
//                                 '20 : الطالع',
//                                 style: TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.bold),
//                               ),
//                               Expanded(
//                                   child: ListView.builder(
//                                 itemCount: 20,
//                                 itemBuilder: (context, index) => const Item(),
//                               )),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     style: ButtonStyle(
//                         backgroundColor:
//                             WidgetStatePropertyAll(Colors.blue.shade700)),
//                     child: const Text(
//                       'الطالع',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               // rag3

//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Column(
//                       children: [
//                         const Text(
//                           '4 : الراجع',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Expanded(
//                             child: ListView.builder(
//                           itemCount: 4,
//                           itemBuilder: (context, index) => const Item(),
//                         )),
//                       ],
//                     );
//                   },
//                 );
//               },
//               style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.red)),
//               child: const Text(
//                 'المرتجع',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
       
//         ],
//       ),
//     );
//   }
// }
