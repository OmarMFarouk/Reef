// import 'package:erp12k/components/tiles/item.dart';
// import 'package:erp12k/src/app_color.dart';
// import 'package:flutter/material.dart';

// class NumbersPage extends StatelessWidget {
//   const NumbersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(   backgroundColor: AppColors.primary,
//         centerTitle: true,
//         title: SizedBox(
//                 height: 90, child: Image.asset('assets/images/logo.jpg')),),
//                 body: Column(children: [
//                     Row(
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
//                 ],),
//     );
//   }
// }