import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/Widgets/mini_return.dart';
import 'package:erp12k/Widgets/return_receipt.dart';
import 'package:erp12k/Widgets/search_add_bar.dart';
import 'package:erp12k/screens/CreatesPage/return_create_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';

class ReturnsPage extends StatefulWidget {
  const ReturnsPage({super.key});

  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  List returnsList = [];
  fetchReturns() async {
    var clientQuery =
        await FirebaseFirestore.instance.collection('clients').get();
    for (var i = 0; i < clientQuery.docs.length; i++) {
      var query = await FirebaseFirestore.instance
          .collection('clients')
          .doc(clientQuery.docs[i].id)
          .collection('returns')
          .get();
      returnsList.addAll(query.docs);
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchReturns();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primary,
            title: const Text(
              'المرتجعات',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: Column(
          children: [
            SearchAddBar(filter: () {}),
            returnsList == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: returnsList!.length,
                      itemBuilder: (context, index) => MiniReturn(returnDetailes: returnsList[index])
                    ),
                  ),

            // ReturnDetailedPageWidget()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              AppNavigation.push(context, const ReturnCreatePage()),
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }
}
