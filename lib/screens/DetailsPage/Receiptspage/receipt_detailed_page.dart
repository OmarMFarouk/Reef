import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/screens/CreatesPage/return_receipt_page.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/client_transaction_tile.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/cutomer_detailed_page_elevated_button.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/dof3a/dof3a_button.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_detailed_card.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_item.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReceiptDetailedPage extends StatefulWidget {
  const ReceiptDetailedPage(
      {super.key,
      required this.clientId,
      required this.receiptId,
      required this.clientName});
  final String clientId;
  final String clientName;
  final String receiptId;
  @override
  State<ReceiptDetailedPage> createState() => _ReceiptDetailedPageState();
}

class _ReceiptDetailedPageState extends State<ReceiptDetailedPage> {
  var printingData;
  Future<void> _printReceipt(receipt) async {
    final pdf = pw.Document();
    var font = await PdfGoogleFonts.cairoBold();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Receipt No: ${receipt['id']}',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text('Date: ${receipt['date']}'),
              pw.SizedBox(height: 20),
              pw.Text(
                'Items:',
                style: const pw.TextStyle(fontSize: 18),
              ),
              pw.TableHelper.fromTextArray(
                headers: ['Name', 'Price', 'Quantity', 'Item Total'],
                cellStyle: pw.TextStyle(
                  font: font,
                ),
                tableDirection: pw.TextDirection.rtl,
                data: [
                  for (var i = 0; i < receipt['items'].length; i++)
                    [
                      receipt['items'][i]['name'],
                      receipt['items'][i]['price'],
                      receipt['items'][i]['quantity'],
                      receipt['items'][i]['price'] *
                          receipt['items'][i]['quantity'],
                    ]
                ],
                // [receipt['items'].map((e){
                //   return [e['price'],e['price'],e['price'],e['price']];
                // })]
              ),
              pw.SizedBox(height: 20),
              pw.Text('Receipt Total Price: ${receipt['price']} جنية',
                  style: pw.TextStyle(
                    font: font,
                  ),
                  textDirection: pw.TextDirection.rtl),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  PageController pageController = PageController(initialPage: 2);
  int currentIndex = 2;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Durations.extralong4, (s) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title:
            SizedBox(height: 90, child: Image.asset('assets/images/logo.jpg')),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: IconButton(
                onPressed: () => _printReceipt(printingData),
                icon: const Icon(Icons.print)),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('clients')
              .doc(widget.clientId)
              .collection('receipts')
              .doc(widget.receiptId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data as DocumentSnapshot;
              // data = data;

              printingData = data;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        ReceiptDetailedCard(
                          isDone: data['remained'] == 0,
                          isPaid: data['paid'] == 0,
                          receiptDetailes: data,
                          clientName: widget.clientName,
                          receiptId: data['id'],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'تاريخ الانشاء',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'اجمالي سعر المرتجع',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'السعر',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'اجمالي المدفوع',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'المتبقي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(data['date'].toString()),
                                // const Text('time'),
                                Text('\n ${data['return_total']}'),

                                Text(data['price'].toString()),
                                Text(data['paid'].toString(),
                                    style: TextStyle(
                                        color: Colors.green.shade800)),
                                Text(data['remained'].toString(),
                                    style:
                                        TextStyle(color: Colors.red.shade800)),
                              ],
                            ),
                            Column(
                              children: [
                                Dof3aButton(
                                  disabled: data['remained'] == 0,
                                  receiptDetails: data,
                                ),
                                ElevatedButton(
                                  onPressed: () => AppNavigation.push(
                                      context,
                                      ReturnReceiptPage(
                                        receiptDetailes: data,
                                      )),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Colors.orange),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'اضافة مرتجع',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DetailedPageElevatedButton(
                            title: 'منتجات المرتجع',
                            ontap: () {
                              pageController.animateToPage(0,
                                  duration: Durations.short1,
                                  curve: Curves.fastEaseInToSlowEaseOut);
                            },
                            isSelected: currentIndex == 0 ? true : false),
                        DetailedPageElevatedButton(
                            title: 'مدفوعات',
                            ontap: () {
                              pageController.animateToPage(1,
                                  duration: Durations.short1,
                                  curve: Curves.fastEaseInToSlowEaseOut);
                            },
                            isSelected: currentIndex == 1 ? true : false),
                        DetailedPageElevatedButton(
                            title: 'منتجات الفاتورة',
                            ontap: () {
                              pageController.animateToPage(2,
                                  duration: Durations.short1,
                                  curve: Curves.fastEaseInToSlowEaseOut);
                            },
                            isSelected: currentIndex == 2 ? true : false),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {
                            currentIndex = value;
                            setState(() {});
                          },
                          controller: pageController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: [
                                  const Row(
                                    // textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('الاجمالي'),
                                      SizedBox(width: 10),
                                      Text('السعر'),
                                      SizedBox(width: 70),
                                      // SizedBox(width: 1),
                                      Text('المنتج'),
                                      SizedBox(width: 30),
                                      Text('الكمية'),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: AppColors.primary,
                                  ),
                                  Expanded(
                                    child: FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection('clients')
                                            .doc(widget.clientId)
                                            .collection('returns')
                                            .where('receipt_id',
                                                isEqualTo: data['id'])
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            var data =
                                                snapshot.data! as QuerySnapshot;
                                            List returnedItems = [];
                                            for (var i = 0;
                                                i < data.docs.length;
                                                i++) {
                                              returnedItems.addAll(
                                                  data.docs[i]['items']);
                                            }
                                            return ListView.builder(
                                              itemCount: returnedItems.length,
                                              itemBuilder: (context, index) =>
                                                  ReceiptItem(
                                                name: returnedItems[index]
                                                    ['name'],
                                                price: returnedItems[index]
                                                    ['item_price'],
                                                quantity: returnedItems[index]
                                                    ['quantity'],
                                              ),
                                            );
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemCount: data['dof3a'].length,
                              itemBuilder: (context, index) =>
                                  ClientTransactionTile(
                                date: data['dof3a'][index]['date'],
                                price: data['dof3a'][index]['price'],
                                way: data['dof3a'][index]['way'],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: [
                                  const Row(
                                    // textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('الاجمالي'),
                                      SizedBox(width: 10),
                                      Text('السعر'),
                                      SizedBox(width: 70),
                                      // SizedBox(width: 1),
                                      Text('المنتج'),
                                      SizedBox(width: 30),
                                      Text('الكمية'),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: AppColors.primary,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: data['items'].length,
                                      itemBuilder: (context, index) =>
                                          ReceiptItem(
                                              name: data['items'][index]
                                                  ['name'],
                                              price: double.parse(data['items']
                                                      [index]['price']
                                                  .toString()),
                                              quantity: data['items'][index]
                                                  ['quantity']),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
