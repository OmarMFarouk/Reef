import 'package:erp12k/screens/Pages/transaction_page.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> transactionsDialog(BuildContext context) {
  late String warehouse;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(
        child: Text(
          'طلب تحويل',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Stack(
        children: [
          SizedBox(
            width: 300.w,
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField( initialValue: 'W',
                        keyboardType: TextInputType.number,
                        onChanged: (value) => warehouse = value,
                        decoration: InputDecoration(
                            label: const Text('رقم المخزن'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                            onPressed: () {
                              AppNavigation.pop(context);

                              AppNavigation.push(
                                  context,
                                  TransactionPage(
                                    warehouse: warehouse,
                                  ));
                            },
                            child: const Text(
                              'اعتماد',
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
        ],
      ),
    ),
  );
}
