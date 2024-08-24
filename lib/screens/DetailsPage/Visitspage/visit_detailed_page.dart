import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/client_detailed_page.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/pages/client_overview.dart';
import 'package:erp12k/screens/DetailsPage/Visitspage/vdp_elevated_page_view_widget.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitDetailedPage extends StatelessWidget {
  const VisitDetailedPage({
    super.key,
    required this.isDone,
    // required this.isToday,
    required this.visitDetailes,
  });
  final String isDone;
  // final bool isToday;
  final visitDetailes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title:
            SizedBox(height: 90, child: Image.asset('assets/images/logo.jpg')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 250.h,
                child: Column(
                  children: [
                    InkWell(
                      // onTap: () => AppNavigation.push(
                      //     context,
                      //     const ClientDetailedPage(
                      //       id: '4UWuLuTclpzKZtEKZlPU',
                      //       clientDetailes: '',
                      //     )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.secondry,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                   Text(
                                   visitDetailes['id'] ,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  if (isDone == 'Done')
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: Colors.purple.shade200),
                                      child: Text(
                                        'تم',
                                        style: TextStyle(
                                            color: Colors.purple.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  else if (isDone == 'Canceled')
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: Colors.red.shade300),
                                      child: Text(
                                        'تم الالغاء',
                                        style: TextStyle(
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  else if (isDone == 'Waiting')
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: Colors.blue.shade300),
                                      child: Text(
                                        'قيد الانتظار',
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  Text(
                                    visitDetailes['client_name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تاريخ و وقت الزيارة',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'الحالة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'الموقع',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'نوع الزيارة',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'سبب الزيارة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'سبب الغاء الزيارة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          ////////////////////////////////////////////////////////////////////////
                          SizedBox(
                            width: 20.w,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(visitDetailes['date']),
                              Text('error'),
                              // Text('شارع بورسعيد, السيدةزينب, القاهرة'),
                              Text('error'),
                              Text(visitDetailes['type']),
                              Text(visitDetailes['reason']),
                              Text('error'),
                              // Text('09-10-2018  10:49 AM'),
                              // Text('قيد الانتظار'),
                              // Text('روتيني/طلب خاص'),
                              // Text('جدوله'),
                              // Text('العميل لا يحبني'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'بيانات العميل',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 26),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  height: 335.h,
                  width: double.infinity,
                  child: FutureBuilder(future: BlocProvider.of<MainCubit>(context).searchClient(visitDetailes['client_id']),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)
                    { var clientDetailes = snapshot.data;
                      return  ClientOverView(
                      clientDetailes: clientDetailes,
                    );
                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    }
                  }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





  // Expanded(
  //           child: ListView(
  //             children: [
  //               FirstVisitPageTile(isToday: isToday, isDone: isDone),
  //               const ClientTile(),
  //               const VisitPageDetailsTile(),  
  //             ],
  //           ),
  //         ),