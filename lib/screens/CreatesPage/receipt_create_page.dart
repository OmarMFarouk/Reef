import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/blocs/main_bloc/main_states.dart';
import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/components/OrdersPageComponents/custom_text_field.dart';
import 'package:erp12k/components/searchfields/client_search_field.dart';
import 'package:erp12k/screens/CreatesPage/client_create_page.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/receipt_detailed_page.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_item.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

String latestClientId = '';
String latestClientName = '';

class ReceiptCreatePage extends StatefulWidget {
  const ReceiptCreatePage({super.key});

  @override
  State<ReceiptCreatePage> createState() => _ReceiptCreatePageState();
}

class _ReceiptCreatePageState extends State<ReceiptCreatePage> {
  TextEditingController quantityCont = TextEditingController();
  // TextEditingController reasonCont = TextEditingController();
  // TextEditingController conditionCont = TextEditingController();
  TextEditingController clientCont = TextEditingController();
  TextEditingController itemNameCont = TextEditingController();
  List itemsList = [];
  Timer? timer;
  int discount = 0;
  @override
  void initState() {
    latestClientId = '';
    latestClientName = '';
    timer = Timer.periodic(Durations.extralong4, (s) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (latestClientName.isNotEmpty) {
      setState(() {
        clientCont.text = latestClientName;
      });
    }
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is MainSuccess) {
          setState(() {});
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primary,
            title: const Text('انشاء فاتورة',
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // textDirection: TextDirection.rtl,
                  children: [
                    const Text(
                      'العميل',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: 200.w,
                        height: 50.h,
                        child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('clients')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                QuerySnapshot clientsData =
                                    snapshot.data as QuerySnapshot;
// discount=clientsData.docs[0]['discount'];
                                return ClientSearchField(
                                  controller: clientCont,
                                  type: 'client',
                                  data: clientsData.docs,
                                  title: 'العميل',
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            })),
                    IconButton(
                      onPressed: () =>
                          AppNavigation.push(context, const ClientCreatePage()),
                      icon: const Icon(Icons.add),
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.green)),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // textDirection: TextDirection.rtl,
                    children: [
                      Row(
                        // textDirection: TextDirection.rtl,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'السعر',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  'الخصم',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'الصافي',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                              Text(
                                calcPrice(itemsList).toStringAsFixed(2),
                                style: TextStyle(
                                  color: Colors.red.shade800,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: latestClientId.isNotEmpty ||
                                        recentClientId.isNotEmpty
                                    ? StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('clients')
                                            .doc(latestClientId.isEmpty
                                                ? recentClientId
                                                : latestClientId)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            discount = snapshot.data!
                                                .data()!['discount'];
                                            return Text((discount /
                                                    100 *
                                                    calcPrice(itemsList))
                                                .toStringAsFixed(2));
                                          } else
                                            return const Text('0');
                                        },
                                      )
                                    : const Text('0'),
                              ),
                              Text((calcPrice(itemsList) -
                                          (discount /
                                              100 *
                                              calcPrice(itemsList)))
                                      .toStringAsFixed(2)
                                  // style: TextStyle(fontSize: 20),
                                  ),
                            ],
                          ),
                        ],
                      ),
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
                                            ReceiptItem(
                                              name: itemsList[index]['name'],
                                              price: itemsList[index]['price'],
                                              quantity: itemsList[index]
                                                  ['quantity'],
                                              // itemsList[index]['subtotal'],
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
                                                              ReceiptItem(
                                                                name: itemsList[
                                                                        index]
                                                                    ['name'],
                                                                price: itemsList[
                                                                        index]
                                                                    ['price'],
                                                                quantity: itemsList[
                                                                        index][
                                                                    'quantity'],
                                                              ),
                                                              CustomTextField(
                                                                inputFormatter: [
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
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
                                                            if (quantityCont
                                                                    .text
                                                                    .isNotEmpty &&
                                                                int.parse(quantityCont
                                                                        .text) <=
                                                                    recentPickedItem!
                                                                        .quantity &&
                                                                quantityCont
                                                                        .text !=
                                                                    '0') {
                                                              setState(() {
                                                                itemsList[index]
                                                                        [
                                                                        'quantity'] =
                                                                    int.parse(
                                                                        quantityCont
                                                                            .text);
                                                                AppNavigation
                                                                    .pop(
                                                                        context);
                                                                AppNavigation
                                                                    .pop(
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
                                                                    Colors
                                                                        .green),
                                                          ),
                                                          child: const Text(
                                                            'تعديل الكمية',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              itemsList
                                                                  .removeAt(
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
                                                                color: Colors
                                                                    .white),
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
                                        'اضافة منتج',
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FutureBuilder(
                                              future: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .collection('products')
                                                  .get(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  QuerySnapshot productsData =
                                                      snapshot.data
                                                          as QuerySnapshot;

                                                  return ClientSearchField(
                                                    controller: itemNameCont,
                                                    type: 'product',
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
                                            inputFormatter: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
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
                                                !itemsList.contains(
                                                    recentPickedItem) &&
                                                quantityCont.text.isNotEmpty &&
                                                recentItemQuantity >=
                                                    int.parse(
                                                        quantityCont.text) &&
                                                quantityCont.text != '0') {
                                              itemsList.add({
                                                'name': recentPickedItem!.name,
                                                'price':
                                                    recentPickedItem!.price,
                                                'quantity': int.parse(
                                                    quantityCont.text),
                                                'product_id':
                                                    recentPickedItem!.docId,
                                                'doc_id':
                                                    recentPickedItem!.docId
                                              });
                                              quantityCont.clear();
                                              itemNameCont.clear();
                                              AppNavigation.pop(context);
                                            }

                                            setState(() {});
                                          },
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.green)),
                                          child: const Text(
                                            'تاكيد',
                                            style:
                                                TextStyle(color: Colors.white),
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
                // SizedBox(height: 100.h,),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  height: 350.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('الاجمالي'),
                            Text('السعر'),
                            SizedBox(width: 2),
                            Text('المنتج'),
                            SizedBox(height: 20, width: 5),
                            Text('الكمية'),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            itemCount: itemsList.length,
                            itemBuilder: (context, index) => ReceiptItem(
                              name: itemsList[index]['name'],
                              price: itemsList[index]['price'],
                              quantity: itemsList[index]['quantity'],
                              // itemsList[index]['subtotal'],
                            ),
                          ),
                        )
                        // const Expanded(
                        //   child: Padding(
                        //     padding: EdgeInsets.all(0.0),
                        //     child: AllReceiptItem(),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                FatoraButton(
                  title: 'تاكيد',
                  color: AppColors.primary,
                  ontap: () async {
                    if (itemsList.isNotEmpty && clientCont.text.isNotEmpty) {
                      final existingDocumentRef = FirebaseFirestore.instance
                          .collection('vars')
                          .doc('id');

                      // Retrieve the field value from the existing document
                      final documentSnapshot = await existingDocumentRef.get();

                      final fieldValue = documentSnapshot.data()!['receipts'];
                      FirebaseFirestore.instance
                          .collection('clients')
                          .doc(latestClientId.isEmpty
                              ? recentClientId
                              : latestClientId)
                          .collection('receipts')
                          .add({
                        'id': "#A${fieldValue + 1}",
                        'client_name': recentClientName,
                        'client_uid': recentClientId,
                        'items': itemsList,
                        'date':
                            DateFormat.yMEd().format(DateTime.now()).toString(),
                        'price': calcPrice(itemsList) -
                            (discount / 100 * calcPrice(itemsList)),
                        'paid': 0,
                        'return_total': 0.0,
                        'discount': (discount / 100 * calcPrice(itemsList)),
                        'remained': calcPrice(itemsList) -
                            (discount / 100 * calcPrice(itemsList)),
                        'dof3a': [],
                      }).then((d) async {
                        for (var i = 0; i < itemsList.length; i++) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('products')
                              .doc(itemsList[i]['doc_id'])
                              .update({
                            'quantity':
                                FieldValue.increment(-itemsList[i]['quantity'])
                          });
                        }
                        await FirebaseFirestore.instance
                            .collection('vars')
                            .doc('id')
                            .update({'receipts': FieldValue.increment(1)});
                        AppNavigation.pushR(
                            context,
                            ReceiptDetailedPage(
                                receiptId: d.id,
                                clientId: recentClientId,
                                clientName: recentClientName));
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('تم انشاء فاتورة'),
                        backgroundColor: Colors.green,
                      ));

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
      ),
    );
  }

  calcPriceAfterDisc(List itemList) async {
    if (clientCont.text.isNotEmpty) {
      var query = await FirebaseFirestore.instance
          .collection('clients')
          .doc(latestClientId.isEmpty ? recentClientId : latestClientId)
          .get();
      double discount =
          double.parse(query.data()!['discount'].toString()) / 100;
      return (calcPrice(itemList) * discount);
    }
  }
}

calcPrice(List itemList) {
  double price = 0;
  for (var i = 0; i < itemList.length; i++) {
    double indexPrice = itemList[i]['price'] * itemList[i]['quantity'];
    price = price + indexPrice;
  }
  return price;
}
