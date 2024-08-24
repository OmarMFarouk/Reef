// import 'package:erp12k/src/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:circle_nav_bar/circle_nav_bar.dart';

// class CustomButtomNavigationBar extends StatefulWidget {
//   const CustomButtomNavigationBar({super.key});

//   @override
//   State<CustomButtomNavigationBar> createState() =>
//       _CustomButtomNavigationBarState();
// }

// class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
//   int _tabIndex = 1;
//   int get tabIndex => _tabIndex;
//   set tabIndex(int v) {
//     _tabIndex = v;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CircleNavBar(
//       activeIcons: const [
//         Icon(Icons.person, color: Colors.white),
//         Icon(Icons.home, color: Colors.white),
//         Icon(Icons.favorite, color: Colors.white),
//       ],
//       inactiveIcons: const [
//         Text("Visits",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         Text("Home",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         Text("Customers",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//       ],
//       color: AppColors.primary,
//       height: 60,
//       circleWidth: 60,
//       activeIndex: tabIndex,
//       onTap: (index) {
//         tabIndex = index;
//       },
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
//       cornerRadius: const BorderRadius.only(
//         topLeft: Radius.circular(8),
//         topRight: Radius.circular(8),
//         bottomRight: Radius.circular(24),
//         bottomLeft: Radius.circular(24),
//       ),
//       shadowColor: Colors.lightGreen,
//       elevation: 10,
//     );
//   }
// }
// // SalomonBottomBar(
// //       currentIndex: _currentIndex,
// //       onTap: (i) => setState(() => _currentIndex = i),
// //       items: [
// //         SalomonBottomBarItem(
// //           icon: const Icon(Icons.favorite_border),
// //           title: const Text("Likes"),
// //           selectedColor: Colors.pink,
// //         ),
// //         SalomonBottomBarItem(
// //           icon: const Icon(Icons.home),
// //           title: const Text("Home"),
// //           selectedColor: AppColors.primary,
// //         ),
// //         SalomonBottomBarItem(
// //           icon: const Icon(Icons.person),
// //           title: const Text("Profile"),
// //           selectedColor: Colors.teal,
// //         ),
// //       ],
// //     );