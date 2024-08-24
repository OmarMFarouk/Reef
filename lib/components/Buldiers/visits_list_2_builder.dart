// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
// import 'package:erp12k/components/tiles/visits_tile_2.dart';
// import 'package:flutter/material.dart';

// class VisitsTile2Builder extends StatefulWidget {
//   const VisitsTile2Builder({
//     super.key,
//     required this.id,
//   });
//   final String id;
//   @override
//   State<VisitsTile2Builder> createState() => _VisitsTile2BuilderState();
// }

// class _VisitsTile2BuilderState extends State<VisitsTile2Builder> {
//   Stream getVisits() {
//     return FirebaseFirestore.instance
//         .collection('clients').where('email',isEqualTo: 'firebasereef@gmail.com')
//         // .doc(widget.id)
//         // .collection('visits')
//         .snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: getVisits(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData)
//           {
//             QuerySnapshot data = snapshot.data as QuerySnapshot;
//           return ListView.builder(
//             itemCount: data.docs.length,
//             itemBuilder: (context, index) => VisitsTile2(visitDetailes: '',
//             ),
//           );
//           }
//           else{
//             return Center(child: CircularProgressIndicator());
//           }
//         }
//         );
//   }
// }
