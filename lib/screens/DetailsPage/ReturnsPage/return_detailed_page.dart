import 'package:erp12k/screens/DetailsPage/ReturnsPage/Widgets/return_detailed_page_widget.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnDetailedPage extends StatelessWidget {
  const ReturnDetailedPage({super.key, required this.returnDetailes});
  final returnDetailes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title:
            SizedBox(height: 90, child: Image.asset('assets/images/logo.jpg')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 220.h,
                width: 300.w,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SelectableText(
                                  returnDetailes['id'],
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  returnDetailes['receipt_id'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  returnDetailes['client_name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   'mo.samad2016@gmail.com',
                                //   style: TextStyle(
                                //       fontSize: 15, color: Colors.black45),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('تاريخ الاسترجاع',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            // Text('وقت الاستلام',
                            //     style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('سبب الاسترجاع',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('الحالة',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              returnDetailes['date'],
                            ),
                            // Text(
                            //       returnDetailes['id'],
                            // ),
                            Text(
                              returnDetailes['reason'],
                            ),
                            Text(
                              returnDetailes['condition'],
                            ),
                            // Text('10:00 AM'),
                            // Text('انتهاء الصلاحيه'),
                            // Text('تبديل المنتج'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
             ReturnDetailedPageWidget(items: returnDetailes['items'],),
          ],
        ),
      ),
    );
  }
}
