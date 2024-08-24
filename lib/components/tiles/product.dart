import 'package:cached_network_image/cached_network_image.dart';
import 'package:erp12k/src/app_color.dart';
// ignore: unused_import
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product extends StatelessWidget {
  Product(
      {super.key,
      this.ontap,
      required this.name,
      required this.imageSrc,
      required this.price,
      this.quantity});
  VoidCallback? ontap;
  final String name;
  final String imageSrc;
  final double price;
  int? quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.secondry,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 90.w,
                  height: 90,
                  child: CachedNetworkImage(imageUrl: imageSrc)),
              Text(
                '${quantity ?? ''}',
                style: AppFonts.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        name,
                      ),
                      Text(price.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'المنتج',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'السعر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
