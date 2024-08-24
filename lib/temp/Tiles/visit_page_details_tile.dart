// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class VisitPageDetailsTile extends StatelessWidget {
//   const VisitPageDetailsTile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             const Text(
//               'تفاصيل الزياره',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 7.h,
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text(
//                   'نوع الزيارة',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   width: 39.w,
//                 ),
//                 const Text(
//                   'تحصيل',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 )
//               ],
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text(
//                   'سبب الغاء الزيارة',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   width: 9.w,
//                 ),
//                 const Text(
//                   'المحل مغلق',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
