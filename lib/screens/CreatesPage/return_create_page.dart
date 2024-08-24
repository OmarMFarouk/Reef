import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/components/Buldiers/all_return_receipt_items.dart';
import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/components/OrdersPageComponents/custom_text_field.dart';
import 'package:erp12k/components/searchfields/client_search_field.dart';
import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
import 'package:erp12k/screens/DetailsPage/ReturnsPage/Widgets/return_detailed_page_widget.dart';
import 'package:erp12k/screens/Pages/returns_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReturnCreatePage extends StatefulWidget {
  const ReturnCreatePage({super.key});

  @override
  State<ReturnCreatePage> createState() => _ReturnCreatePageState();
}

class _ReturnCreatePageState extends State<ReturnCreatePage> {
  TextEditingController quantityCont = TextEditingController();
  TextEditingController reasonCont = TextEditingController();
  TextEditingController conditionCont = TextEditingController();
  TextEditingController clientCont = TextEditingController();
  TextEditingController itemNameCont = TextEditingController();

  List itemsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'انشاء مرتجع',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 250.w,
                      // height: 50.h,
                      child: FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('clients')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              QuerySnapshot clientsData =
                                  snapshot.data as QuerySnapshot;

                              return ClientSearchField(
                                controller: clientCont,
                                type: 'client',
                                data: clientsData.docs,
                                title: 'العميل',
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          })),
                  const Text(
                    'العميل',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 250.w,
                    // height: 40.h,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'السبب',
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      // value: 'test',
                      items: const [
                        DropdownMenuItem(
                          value: 'انتهاء الصلاحية',
                          child: Text('انتهاء الصلاحية'),
                        ),
                        DropdownMenuItem(
                          value: 'المنتج تالف',
                          child: Text('المنتج تالف'),
                        ),
                      ],
                      onChanged: (value) {
                        reasonCont.text = value!;
                      },
                    ),
                  ),
                  const Text(
                    'السبب',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //     width: 200.w,
                  //     height: 50.h,
                  //     child: FutureBuilder(
                  //         future: FirebaseFirestore.instance
                  //             .collection('variables')
                  //             .where("category", isEqualTo: "return_reasons")
                  //             .get(),
                  //         builder: (context, snapshot) {
                  //           if (snapshot.hasData) {
                  //             QuerySnapshot clientsData =
                  //                 snapshot.data as QuerySnapshot;
                  //             print(clientsData.docChanges[0]);
                  //             return ClientSearchField(
                  //               controller: reasonCont,
                  //               type: 'variables',
                  //               data: clientsData.docs,
                  //               title: 'السبب',
                  //             );
                  //           } else {
                  //             return Center(child: CircularProgressIndicator());
                  //           }
                  //         })),
                ],
              ),
              SizedBox(height: 8.h,),

              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 250.w,
                    // height: 40.h,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'الحالة',
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      // value: 'test',
                      items: const [
                        DropdownMenuItem(
                          value: 'استرجاع المنتج',
                          child: Text('استرجاع المنتج'),
                        ),
                        DropdownMenuItem(
                          value: 'تبديل المنتج',
                          child: Text('تبديل المنتج'),
                        ),
                        DropdownMenuItem(
                          value: 'استرداد المبلغ',
                          child: Text('استرداد المبلغ'),
                        ),
                      ],
                      onChanged: (value) {
                        conditionCont.text=value!;
                      },
                    ),
                  ),
                  Text(
                    'الحالة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(
                  //     width: 200.w,
                  //     height: 50.h,
                  //     child: FutureBuilder(
                  //         future: FirebaseFirestore.instance
                  //             .collection('variables')
                  //             .where("category", isEqualTo: "condition")
                  //             .get(),
                  //         builder: (context, snapshot) {
                  //           if (snapshot.hasData) {
                  //             QuerySnapshot clientsData =
                  //                 snapshot.data as QuerySnapshot;
                  //             print(clientsData.docChanges[0]);
                  //             return ClientSearchField(
                  //               controller: conditionCont,
                  //               type: 'variables',
                  //               data: clientsData.docs,
                  //               title: 'الحالة',
                  //             );
                  //           } else {
                  //             return Center(child: CircularProgressIndicator());
                  //           }
                  //         })),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          // width: 100.w,
                          child: ElevatedButton(
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView.builder(
                                      itemCount: itemsList.length,
                                      itemBuilder: (context, index) =>
                                          ReturnReceiptItem(
                                            num: int.parse(
                                                itemsList[index]['quantity']),
                                            title: itemsList[index]['name'],
                                            ontap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'تعديل المرتجع'),
                                                    content: SizedBox(
                                                        height: 150,
                                                        child: Column(
                                                          children: [
                                                            ReturnReceiptItem(
                                                              title: itemsList[
                                                                      index]
                                                                  ['name'],
                                                              num: int.parse(
                                                                  itemsList[
                                                                          index]
                                                                      [
                                                                      'quantity']),
                                                              ontap: () {},
                                                            ),
                                                            CustomTextField(
                                                              controller:
                                                                  quantityCont,
                                                              title: 'الكمية',
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                            )
                                                          ],
                                                        )),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          if (quantityCont.text
                                                              .isNotEmpty) {
                                                            setState(() {
                                                              itemsList[index][
                                                                      'quantity'] =
                                                                  quantityCont
                                                                      .text;
                                                              AppNavigation.pop(
                                                                  context);
                                                              AppNavigation.pop(
                                                                  context);
                                                              quantityCont
                                                                  .clear();
                                                            });
                                                          }
                                                        },
                                                        style:
                                                            const ButtonStyle(
                                                          backgroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Colors.green),
                                                        ),
                                                        child: const Text(
                                                          'تعديل الكمية',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            itemsList.removeAt(
                                                                index);
                                                            AppNavigation.pop(
                                                                context);
                                                            AppNavigation.pop(
                                                                context);
                                                          });
                                                        },
                                                        style:
                                                            const ButtonStyle(
                                                          backgroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Colors.red),
                                                        ),
                                                        child: const Text(
                                                          'حذف',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                    actionsAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                  );
                                                },
                                              );
                                            },
                                          )),
                                );
                              },
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.red),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'تعديل الفاتورة',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'اضافة مرتجع',
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FutureBuilder(
                                            future: FirebaseFirestore.instance
                                                .collection('products')
                                                .get(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                QuerySnapshot productsData =
                                                    snapshot.data
                                                        as QuerySnapshot;

                                                return ClientSearchField(
                                                  controller: itemNameCont,
                                                  type: 'comp_product',
                                                  data: productsData.docs,
                                                  title: 'المنتجات',
                                                );
                                              } else {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            }),
                                        const SizedBox(height: 10),
                                        CustomTextField(
                                          controller: quantityCont,
                                          padding: 16,
                                          title: 'كمية المنتج',
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (itemNameCont.text.isNotEmpty &&
                                              quantityCont.text.isNotEmpty) {
                                            itemsList.add({
                                              'name': itemNameCont.text,
                                              'quantity': quantityCont.text
                                            });
                                            quantityCont.clear();
                                            itemNameCont.clear();
                                            AppNavigation.pop(context);
                                          }
                                          print(itemsList
                                              .map((e) => e['name'])
                                              .toList());
                                          setState(() {});
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.green)),
                                        child: const Text(
                                          'تاكيد',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                    actionsAlignment: MainAxisAlignment.start,
                                  );
                                }),
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.green),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'اضافة منتج',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ReturnDetailedPageWidget(
                items: itemsList,
              ),
              FatoraButton(
                title: 'تاكيد',
                color: AppColors.primary,
                ontap: () {
                  if (itemsList.isNotEmpty &&
                      clientCont.text.isNotEmpty &&
                      reasonCont.text.isNotEmpty &&
                      conditionCont.text.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection('clients')
                        .doc(recentClientId)
                        .collection('returns')
                        .add({
                            'id':"#R${BlocProvider.of<MainCubit>(context).allReturns!.length+1}",
                      'client_name': recentClientName,
                      'client_id': recentClientId,
                      'receipt_id':'',
                      'items': itemsList,
                      'condition': conditionCont.text,
                      'reason': reasonCont.text,
                      'date':
                          DateFormat.yMEd().format(DateTime.now()).toString()
                    });

                    AppNavigation.pop(context);
                    AppNavigation.pop(context);
                    AppNavigation.push(context, const ReturnsPage());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('تم انشاء مرتجع'),
                      backgroundColor: Colors.green,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
