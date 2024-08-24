// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/receipt_detailed_page.dart';
import 'package:erp12k/screens/DetailsPage/Receiptspage/widgets/receipt_detailed_card.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dof3aPage extends StatelessWidget {
  Dof3aPage({super.key, required this.receiptDetails});
  @override
  var receiptDetails;
  int dropValue = 0;
  double priceValue = 0;
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'اضافة دفعة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                ReceiptDetailedCard(
                  isPaid: false,
                  isDone:
                      (receiptDetails['price'] - receiptDetails['discount']) ==
                              receiptDetails['paid']
                          ? true
                          : false,
                  clientName: receiptDetails['client_name'],
                  receiptId: receiptDetails['id'],
                ),
                Row(textDirection: TextDirection.rtl,
            
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'تاريخ الانشاء',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'السعر',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'الخصم',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'الصافي',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'اجمالي المدفوع',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'المتبقي',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(receiptDetails['date']),
                        Text(
                          {receiptDetails['price']+receiptDetails['discount']}.toString(),
                          style: TextStyle(
                            color: Colors.red.shade800,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(receiptDetails['discount'].toString()),
                        Text(
                          receiptDetails['price'].toString() 
                          // style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          receiptDetails['paid'].toString(),
                          style: TextStyle(color: Colors.green.shade800),
                        ),
                        Text(receiptDetails['remained'].toString(),
                            style: TextStyle(color: Colors.red.shade800)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue:
                        DateTime.now().toString().replaceRange(16, null, ''),
                    decoration: InputDecoration(
                        label: const Text('تاريخ و وقت الدفع'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    onChanged: (value) {
                      priceValue = double.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*فارغ';
                      }
                      else if(int.parse(value) ==0)
                      {
                        return 'المبلغ خطأ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        label: const Text('المبلغ المدفوع'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'كيفية الدفع',
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    // value: 'test',
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text('كاش'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('شيك'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('تحويل بنكي'),
                      ),
                    ],
                    onChanged: (value) {
                      dropValue = value!;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () async{
                          if (key.currentState!.validate() &&
                              dropValue != 0 &&
                              // priceValue != 0 &&
                           
                              priceValue <= receiptDetails['remained']) {
                                    BlocProvider.of<MainCubit>(context).allReceipts!.clear();
                await            BlocProvider.of<MainCubit>(context).addDof3a(
                                clientDoc: receiptDetails['client_uid'],
                                method: dropValue == 1
                                    ? 'cash'
                                    : dropValue == 2
                                        ? 'check'
                                        : 'bank',
                                price: priceValue,
                                receiptDoc: receiptDetails.id);
                                 var newDetails = await FirebaseFirestore.instance.collection('clients').doc(receiptDetails['client_uid']).collection('receipts').doc(receiptDetails.id).get();
                            AppNavigation.pop(context); 
                      
                            AppNavigation.pushR(
                                context,
                                ReceiptDetailedPage(
                                  receiptId: receiptDetails.id,
                                  clientId: receiptDetails['client_uid'],
                                  clientName: receiptDetails['client_name'],));
                              
                      
              

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم اضافة دفعة'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else if (priceValue > receiptDetails['remained']) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('المبلغ غير صحيح'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'تاكيد',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
