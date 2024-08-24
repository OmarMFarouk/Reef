import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/Widgets/search_add_bar.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/blocs/main_bloc/main_states.dart';
import 'package:erp12k/components/tiles/product.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              centerTitle: true,
              title: const Text(
                'منتجات الشركة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                SearchAddBar(filter: () {}),
                Expanded(
                    child: StreamBuilder(
                        stream: cubit.getProduct(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            QuerySnapshot data = snapshot.data as QuerySnapshot;
                            return ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) => Product(
                                imageSrc: data.docs[index]['image'],
                                name: data.docs[index]['name'],
                                price: data.docs[index]['price'],
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }))
              ],
            ));
      },
    );
  }
}
