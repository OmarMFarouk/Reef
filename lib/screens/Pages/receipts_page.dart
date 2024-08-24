import 'dart:async';

import 'package:erp12k/Widgets/mini_receipt.dart';
import 'package:erp12k/Widgets/search_add_bar.dart';
import 'package:erp12k/blocs/main_bloc/main_states.dart';
import 'package:erp12k/screens/CreatesPage/receipt_create_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../blocs/main_bloc/main_cubit.dart';

class ReceiptsPage extends StatefulWidget {
  const ReceiptsPage({super.key});

  @override
  State<ReceiptsPage> createState() => _ReceiptsPageState();
}

class _ReceiptsPageState extends State<ReceiptsPage> {
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      timer = Timer.periodic(Durations.short1, (s) {
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
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: AppColors.primary,
                title: const Text(
                  'الفواتير',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            body: Column(
              children: [
                SearchAddBar(
                  filter: () {},
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.allReceipts!.length,
                    itemBuilder: (context, index) => MiniReceipt(
                      rId: cubit.allReceipts![index].id,
receiptDetailes:cubit.allReceipts![index],
                      clientName:cubit.allReceipts![index]['client_name'],
                      //  cubit.allReceipts![index]['date']
                      //     .toString()
                      //     .split('UTC')
                      //     .first,
                      receiptid: cubit.allReceipts![index]['id'],
                      price: cubit.allReceipts![index]['price'],
                      // receiptId: cubit.allReceipts![index]['id'],
                      clientId: cubit.allReceipts![index]['client_uid'],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  AppNavigation.push(context, const ReceiptCreatePage()),
              backgroundColor: AppColors.primary,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
