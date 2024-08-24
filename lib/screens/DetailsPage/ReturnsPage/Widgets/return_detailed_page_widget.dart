import 'package:erp12k/components/Buldiers/all_return_receipt_items.dart';
import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnDetailedPageWidget extends StatefulWidget {
  const ReturnDetailedPageWidget({super.key, required this.items});
  final List items;
  @override
  State<ReturnDetailedPageWidget> createState() =>
      _ReturnDetailedPageWidgetState();
}

class _ReturnDetailedPageWidgetState extends State<ReturnDetailedPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          height: 370.h,
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4.0, top: 8, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('الكمية',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(''),
                    Text('المنتج',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.primary,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.items!.length,
                    itemBuilder: (context, index) => ReturnReceiptItem(
                          num: widget.items![index]['quantity'],
                          title: widget.items![index]['name'],
                          ontap: () {},
                        )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
