import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/components/HomePageComponents/sub_cont.dart';
import 'package:erp12k/Widgets/notes_container.dart';
import 'package:erp12k/components/static/my_drawer.dart';
import 'package:erp12k/screens/Pages/car_storage_page.dart';
import 'package:erp12k/screens/Pages/client_page.dart';
import 'package:erp12k/screens/Pages/receipts_page.dart';
import 'package:erp12k/screens/Pages/returns_page.dart';
import 'package:erp12k/screens/Pages/visit_page.dart';
import 'package:erp12k/screens/Pages/products_page.dart';
import 'package:erp12k/screens/Pages/transaction_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int clientsCount;
  late int myProductsCount;
  late int productsCount;
  int receiptsCount = 0;
  List memos = [];
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getAllVisits();
    BlocProvider.of<MainCubit>(context).getAllReceipts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_on)),
        ],
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title:
            SizedBox(height: 90, child: Image.asset('assets/images/logo.jpg')),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future(() async {
            QuerySnapshot memosQuery =
                await FirebaseFirestore.instance.collection('memos').get();
            memos = memosQuery.docs;
            QuerySnapshot clientQuery =
                await FirebaseFirestore.instance.collection('clients').get();

            QuerySnapshot myProductsQuery = await FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('products')
                .get();
            QuerySnapshot productsQuery =
                await FirebaseFirestore.instance.collection('products').get();
            clientsCount = clientQuery.docs.length;
            myProductsCount = myProductsQuery.docs.length;
            productsCount = productsQuery.docs.length;
         var countsQuery =  FirebaseFirestore.instance.collection('vars').doc('id').get();
         return countsQuery;
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                           
 var data = snapshot.data!.data();
 lastReceiptIndex=data!['receipts'];
 lastReturnIndex=data['returns'];
lastTransferIndex=data['transfers'];
 lastVisitIndex=data['visits'];
              return Column(
                children: [
                  Wrap(
                    children: [
                      Mainsubcont(
                        color: Colors.red,
                        ontap: () {
                          AppNavigation.push(context, const ReceiptsPage());
                        },
                        subnum: lastReceiptIndex,
                        subtext:'فواتير',
                        subicon: Icons.receipt,
                      ),
                      Mainsubcont(
                        color: Colors.blue,
                        ontap: () =>
                            AppNavigation.push(context, const ClientPage()),
                        subnum: clientsCount,
                        subtext: 'عملاء',
                        subicon: Icons.people,
                      ),
                      Mainsubcont(
                        color: Colors.green,
                        ontap: () =>
                            AppNavigation.push(context, const ReturnsPage()),
                        subnum: lastReturnIndex,
                            
                        subtext: 'مرتجعات',
                        subicon: Icons.repeat_rounded,
                      ),
                      Mainsubcont(
                        color: Colors.orange,
                        ontap: () =>
                            AppNavigation.push(context, const VisitPage()),
                        subnum:lastVisitIndex,
                        subtext: 'زيارات',
                        subicon: Icons.home_work,
                      ),
                      // Mainsubcont(
                      //   color: Colors.purple,
                      //   ontap: () {

                      //   },
                      //   subnum: 1,
                      //   subtext: 'التقارير',
                      //   subicon: Icons.moving_outlined,
                      // ),
                      Mainsubcont(
                        color: Colors.indigo.shade900,
                        ontap: () => AppNavigation.push(
                            context, const TransactionPage(warehouse: '5')),
                        subnum:lastTransferIndex,
                        subtext: 'التحويلات',
                        subicon: Icons.compare_arrows_outlined,
                      ),
                      Mainsubcont(
                        color: Colors.brown,
                        ontap: () =>
                            AppNavigation.push(context, const CarStoragePage()),
                        subnum: myProductsCount,
                        subtext: 'مخزني',
                        subicon: Icons.local_shipping,
                      ),
                      Mainsubcont(
                        color: Colors.black,
                        ontap: () =>
                            AppNavigation.push(context, const ProductsPage()),
                        subnum: productsCount,
                        subtext: 'المنتجات',
                        subicon: Icons.shopping_cart_rounded,
                      ),
                    ],
                  ),
                  NotesContainer(
                    title: 'ملاحظات',
                    color: Colors.pink,
                    memos: memos,
                  ),
                ],
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
 int lastReceiptIndex = 0;
 int lastReturnIndex = 0;
 int lastVisitIndex = 0;
 int lastTransferIndex = 0;