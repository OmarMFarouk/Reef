import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/client_detailed_page.dart';
import 'package:erp12k/components/tiles/general_tile_data_row.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';

class ClientTile extends StatelessWidget {
  const ClientTile(
      {super.key,
      required this.name,
      required this.id,
      required this.phone1,
      required this.address,
      required this.dateCreated,
      required this.clientDetailes,
      required this.image});
  final String name;
  final String image;
  final String id;
  final String phone1;
  final String address;
  final String dateCreated;
  final clientDetailes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () => AppNavigation.push(
          context,
          ClientDetailedPage(
            id: id,
            clientDetailes: clientDetailes,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.secondry,
              borderRadius: BorderRadius.circular(26)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: AppFonts.black,
                      ),
                      Text('+20$phone1',
                          style: TextStyle(color: Colors.black45)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(image),
                      child: image.isEmpty
                          ? null
                          : Text(name[0] + ' ' + name.split(' ').last[0]),
                    ),
                  ),
                ],
              ),
              GeneralTileDataRow(
                data: address,
                icon: Icons.location_on,
              ),
              GeneralTileDataRow(
                data: dateCreated.toString().split(' ').first,
                icon: Icons.calendar_today,
              ),
              const GeneralTileDataRow(
                  data: 'نوع العميل؟؟', icon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
