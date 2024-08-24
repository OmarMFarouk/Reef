import 'package:erp12k/screens/DetailsPage/Clinetspage/pages/client_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VdpElevatedPageViewWidget extends StatelessWidget {
  const VdpElevatedPageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'بيانات العميل',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          height: 335.h,
          width: double.infinity,
          child: const ClientOverView(clientDetailes: '',),
        ),
      ],
    );
  }
}
