import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/screens/DetailsPage/Visitspage/visit_detailed_page.dart';
import 'package:erp12k/components/tiles/general_tile_data_row.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitsTile2 extends StatelessWidget {
  const VisitsTile2({
    super.key,
    required this.visitDetailes
  });
  final visitDetailes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigation.push(
        context,
         VisitDetailedPage(visitDetailes: visitDetailes,
          // isToday: false,
          isDone: 'Waiting',
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.secondry,
              borderRadius: BorderRadius.circular(26),
             ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        visitDetailes['client_name'],
                        style: AppFonts.black,
                      ),
                       FutureBuilder(
                        future:FirebaseFirestore.instance.collection('clients').doc(visitDetailes['client_id']).get(),
                         builder:(context,snapshot){
                          if (snapshot.hasData) {
                          return   Text(snapshot.data!['phone1'],style: const TextStyle(color: Colors.black45));
                            
                          }
                          else {
                            return const Text('غير متاح');
                          }
                         })
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                        
                      child: Text(visitDetailes['client_name'].split(' ').first[0].toUpperCase()),
                    ),
                  ),
                ],
              ),
              const GeneralTileDataRow(
                data: 'Cairo,Egypt',
                icon: Icons.location_on,
              ),
               GeneralTileDataRow(
                data: visitDetailes['date'],
                icon: Icons.calendar_today,
              ),
               GeneralTileDataRow(
                  data: visitDetailes['id'], icon: Icons.watch_later_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
