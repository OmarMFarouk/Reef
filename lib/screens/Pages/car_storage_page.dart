import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/blocs/main_bloc/main_states.dart';
import 'package:erp12k/components/tiles/product.dart';
import 'package:erp12k/screens/CreatesPage/transaction_create_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarStoragePage extends StatefulWidget {
  const CarStoragePage({super.key});

  @override
  State<CarStoragePage> createState() => _CarStoragePageState();
}

class _CarStoragePageState extends State<CarStoragePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit= MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primary,
            title: const Text(
              'مخزن السيارة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: Text(
                              '${snapshot.data!['products'].length} : عدد المنتجات في السيارة',
                              // '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Product(
                            // imageSrc: '',name: '',price: 9,
                            name: snapshot.data!['products'][index]['name'],
                            imageSrc: snapshot.data!['products'][index]['image'],

                            // imageSrc: '',
                            price: double.parse(snapshot.data!['products'][index]['price'].toString()),
                            quantity: snapshot.data!['products'][index]['quantity'],
                          ),
                            itemCount: snapshot.data!['products'].length,
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                AppNavigation.push(context, const TransactionCreatePage()),
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
