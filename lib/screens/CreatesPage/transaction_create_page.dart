import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/components/OrdersPageComponents/custom_text_field.dart';
import 'package:erp12k/components/searchfields/client_search_field.dart';
import 'package:erp12k/components/tiles/return_receipt_item_tile.dart';
import 'package:erp12k/screens/DetailsPage/ReturnsPage/Widgets/return_detailed_page_widget.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCreatePage extends StatefulWidget {
  const TransactionCreatePage({super.key});

  @override
  State<TransactionCreatePage> createState() => _TransactionCreatePageState();
}

class _TransactionCreatePageState extends State<TransactionCreatePage> {
  @override
  TextEditingController carNameCont = TextEditingController();
  TextEditingController itemNameCont = TextEditingController();
  TextEditingController amountCont = TextEditingController();
  List itemsList = [];
  List myItems = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'انشاء طلب تحويل',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: const Text(
                      'العربة',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .where('email',
                              isNotEqualTo:
                                  FirebaseAuth.instance.currentUser!.email)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          QuerySnapshot carsData =
                              snapshot.data as QuerySnapshot;
                          List carsList = [];
                          for (var i = 0; i < carsData.docs.length; i++) {
                            carsList.add(snapshot.data!.docs[i]);
                          }
                          return SizedBox(
                            width: 200.w,
                            height: 50.h,
                            child: ClientSearchField(
                              controller: carNameCont,
                              type: 'car',
                              data: carsList,
                              title: 'العربة',
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      height: 92,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'طلب تحويل للمخزن',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                        'تاكيد علي طلب تحويل كل مخزون العربة للمخزن'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: FutureBuilder(
                                            future: FirebaseFirestore.instance
                                                .collection('warehouses')
                                                .get(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                QuerySnapshot productData =
                                                    snapshot.data
                                                        as QuerySnapshot;

                                                return ClientSearchField(
                                                  controller: carNameCont,
                                                  type: 'product',
                                                  data: productData.docs[0]
                                                      ['products'],
                                                  title: 'العربة',
                                                );
                                              } else {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            }),
                                      ),
        
        
        
        
        
        
                                    ),
        
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      AppNavigation.pop(context);
                                      AppNavigation.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'تم تحويل كل مخزون العربة للمخزن'),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.green)),
                                    child: const Text(
                                      'تاكيد',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => AppNavigation.pop(context),
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.red)),
                                    child: const Text(
                                      'الغاء',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                                actionsAlignment: MainAxisAlignment.spaceAround,
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.indigo),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'تحويل للمخزن',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 70.w,
                    // ),
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
                                      num: itemsList[index]['quantity'],
                                      ontap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('تعديل المنتج'),
                                              content: SizedBox(
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      ReturnReceiptItem(
                                                        title: itemsList[index]
                                                            ['name'],
                                                        num: itemsList[index]
                                                            ['quantity'],
                                                        ontap: () {},
                                                      ),
                                                      CustomTextField(
                                                        controller: amountCont,
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
                                                    if (recentItemQuantity >=
                                                        int.parse(
                                                            amountCont.text)) {
                                                      setState(() {
                                                        itemsList[index]
                                                                ['quantity'] =
                                                            int.parse(amountCont
                                                                .text);
                                                      });
                                                      AppNavigation.pop(
                                                          context);
                                                      amountCont.clear();
                                                      itemNameCont.clear();
                                                    }
                                                  },
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.green),
                                                  ),
                                                  child: const Text(
                                                    'تعديل الكمية',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      itemsList.removeAt(index);
                                                    });
                                                    AppNavigation.pop(context);
                                                    AppNavigation.pop(context);
                                                  },
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.red),
                                                  ),
                                                  child: const Text(
                                                    'حذف',
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                                      title: itemsList[index]['name'],
                                    ),
                                  ),
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
                              'تعديل الطلب',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          // width: 98.w,
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
                                        const SizedBox(
                                          width: 100000,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 1000.w,
                                            // height: 130.h,
                                            child: FutureBuilder(
                                                future: FirebaseFirestore
                                                    .instance
                                                    .collection('users')
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .get(),
                                                builder: (context, snapshot) {
                                                  // itemNameCont.clear();
                                                  amountCont.clear();
                                                  if (snapshot.hasData) {
                                                    DocumentSnapshot
                                                        productData =
                                                        snapshot.data
                                                            as DocumentSnapshot;
                                                    myItems =
                                                        productData['products'];
                                                    recentClientName =
                                                        productData['name'];
                                                    recentClientId =
                                                        productData['car'];
                                                    return Column(
                                                      children: [
                                                        ClientSearchField(
                                                          controller:
                                                              itemNameCont,
                                                          type: 'product',
                                                          data: productData[
                                                              'products'],
                                                          title: 'منتج',
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10),
                                                          child:
                                                              CustomTextField(
                                                            controller:
                                                                amountCont,
                                                            title:
                                                                'كمية المنتج',
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            if (recentItemQuantity >=
                                                                int.parse(
                                                                    amountCont
                                                                        .text)) {
                                                              setState(() {
                                                                itemsList.add({
                                                                  'name':
                                                                      itemNameCont
                                                                          .text,
                                                                  'quantity': int.parse(
                                                                      amountCont
                                                                          .text),
                                                                });
                                                                  print(myItems);
                                                         int myindex=       itemsList.indexWhere((e)=>e['name'].toString().contains(itemNameCont.text));
                                                                myItems.removeAt(myindex);
                                                                myItems.insert(myindex,{
                                                                  'name':
                                                                      itemNameCont
                                                                          .text,
                                                                  'quantity': int.parse(
                                                                      amountCont
                                                                          .text),
                                                                });
                                                              });
                                                              print(myItems);
                                                              AppNavigation.pop(
                                                                  context);
                                                              amountCont
                                                                  .clear();
                                                              itemNameCont
                                                                  .clear();
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                content: Text(
                                                                    'من فضلك ادخل البيانات بطريقه صحيحة'),
                                                                backgroundColor:
                                                                    Colors.red,
                                                              ));
                                                            }
                                                          },
                                                          style: const ButtonStyle(
                                                              backgroundColor:
                                                                  WidgetStatePropertyAll(
                                                                      Colors
                                                                          .green)),
                                                          child: const Text(
                                                            'تاكيد',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  } else {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // actions: [],
                                    // actionsAlignment: MainAxisAlignment.start,
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
                ontap: () async {
                  if (itemsList.isNotEmpty && carNameCont.text.isNotEmpty) {
                    final existingDocumentRef =
                        FirebaseFirestore.instance.collection('vars').doc('id');
                    final documentSnapshot = await existingDocumentRef.get();

                    FirebaseFirestore.instance.collection('transactions').add({
                      'id': "#T${documentSnapshot['transfers']}",
                      'from_id': recentClientId,
                      'from_name': recentClientName,
                      'to_id': recentCar,
                      'to_name': recentDriver,
                      'statues': 'waiting',
                      'type': 'car to car',
                      'items': itemsList,
                      'date': DateTime.now().toString(),
                    }).then((d) async {
                      await FirebaseFirestore.instance
                          .collection('vars')
                          .doc('id')
                          .update({'transfers': FieldValue.increment(1)});
                    });
                    print(recentDriverID);
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                            {'products': FieldValue.arrayRemove(itemsList)});
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc('figOYIznALgEQjhZigX6WSllHIY2')
                        .update({'products': FieldValue.arrayUnion(itemsList)});

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('تم انشاء فاتورة'),
                      backgroundColor: Colors.green,
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('تم انشاء مرتجع'),
                      backgroundColor: Colors.green,
                    ));
                  }
                  AppNavigation.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('تم انشاء طلب تحويل للسيارة'),
                    backgroundColor: Colors.green,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
