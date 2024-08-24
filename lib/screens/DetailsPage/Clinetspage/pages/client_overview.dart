import 'package:erp12k/screens/DetailsPage/Clinetspage/Lists/client_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientOverView extends StatelessWidget {
  const ClientOverView({
    super.key,
    required this.clientDetailes,
  });
  final clientDetailes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 400.h,
                width: 99.w,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ClientData.labels.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ClientData.labels[index],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400.h,
                width: 212.w,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  // itemCount: ClientData.data.length,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['name'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['companyName'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['email'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['phone1'] + '\t20+',
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['phone2'] + '\t20+',
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['address'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['area'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['area2'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['area3'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(clientDetailes['dateCreated'],
                          textDirection: TextDirection.rtl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('${clientDetailes['discount']}%',
                          textDirection: TextDirection.rtl),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //    Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(35),
          //         color: Colors.black12),
          //     child: Expanded(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           CustomElevatedButton(
          //             color: Colors.red,
          //             icon: const Icon(Icons.delete),
          //             ontap: () {},
          //           ),
          //           CustomElevatedButton(
          //             color: Colors.green,
          //             icon: const Icon(Icons.location_on),
          //             ontap: () {},
          //           ),
          //           CustomElevatedButton(
          //             color: Colors.blue,
          //             icon: const Icon(Icons.call),
          //             ontap: () {},
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
