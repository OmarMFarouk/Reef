// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FirstVisitPageTile extends StatelessWidget {
//   const FirstVisitPageTile({
//     super.key,
//     required this.isToday,
//     required this.isDone,
//   });

//   final bool isToday;
//   final String isDone;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         height: 150.h,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             const Text(
//               'حالة الزيارة',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text('التوقيت'),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(35),
//                       color: isToday
//                           ? Colors.green.shade300
//                           : Colors.red.shade300),
//                   child: Text(
//                     isToday ? 'اليوم' : 'قادم',
//                     style: TextStyle(
//                         color: isToday
//                             ? Colors.green.shade900
//                             : Colors.red.shade900,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text('الحالة'),
//                 SizedBox(
//                   width: 22.w,
//                 ),
//                 if (isDone == 'Done')
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35),
//                         color: Colors.purple.shade200),
//                     child: Text(
//                       'تم',
//                       style: TextStyle(
//                           color: Colors.purple.shade900,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 else if (isDone == 'Canceled')
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35),
//                         color: Colors.red.shade300),
//                     child: Text(
//                       'تم الالغاء',
//                       style: TextStyle(
//                           color: Colors.red.shade900,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 else if (isDone == 'Waiting')
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35),
//                         color: Colors.blue.shade300),
//                     child: Text(
//                       'قيد الانتظار',
//                       style: TextStyle(
//                           color: Colors.blue.shade900,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 else
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35),
//                         color: Colors.grey.shade300),
//                     child: Text(
//                       'خطا',
//                       style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//               ],
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text('التاريخ'),
//                 SizedBox(width: 32.w),
//                 const Text(
//                   '02/22/2024',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 const Text('الوقت'),
//                 SizedBox(
//                   width: 30.w,
//                 ),
//                 const Text(
//                   '10:30 AM - 12 AM',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
