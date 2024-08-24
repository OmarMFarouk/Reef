import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/client_transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/main_bloc/main_cubit.dart';

class ClientTransactionsPage extends StatelessWidget {
  final trxList;
  const ClientTransactionsPage({super.key,required this.trxList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trxList.length,
      itemBuilder: (context, index) => ClientTransactionTile(
        date: trxList[index]
            ['date'],
        price: trxList[index]
            ['price'],
        way:trxList[index]
            ['way'],
      ),
    );
  }
}
