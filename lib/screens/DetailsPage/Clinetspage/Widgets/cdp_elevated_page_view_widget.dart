import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/Widgets/mini_receipt.dart';
import 'package:erp12k/Widgets/mini_return.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/components/Buldiers/visits_list_2_builder.dart';
import 'package:erp12k/components/tiles/visits_tile_2.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/Tiles/cutomer_detailed_page_elevated_button.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/pages/client_overview.dart';
import 'package:erp12k/screens/DetailsPage/Clinetspage/pages/client_transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CDPElevatedPageViewWidget extends StatefulWidget {
  const CDPElevatedPageViewWidget({
    super.key,
    required this.clientDetailes,
    required this.id,
  });
  final clientDetailes;
  final String id;
  @override
  State<CDPElevatedPageViewWidget> createState() =>
      _CDPElevatedPageViewWidgetState();
}

class _CDPElevatedPageViewWidgetState extends State<CDPElevatedPageViewWidget> {
  int pageIndex = 4;
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getClientReturns(clientId: widget.id);
    BlocProvider.of<MainCubit>(context)
        .getClientsTransactions(clientId: widget.id);
    super.initState();
  }

  final PageController _pageController = PageController(initialPage: 4);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50.h,
            width: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  DetailedPageElevatedButton(
                    title: 'نظرة عامة',
                    ontap: () => _pageController.animateToPage(4,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut),
                    isSelected: pageIndex == 4 ? true : false,
                  ),
                  DetailedPageElevatedButton(
                    title: 'فواتير',
                    ontap: () => _pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut),
                    isSelected: pageIndex == 3 ? true : false,
                  ),
                  DetailedPageElevatedButton(
                    title: 'زيارات',
                    ontap: () => _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut),
                    isSelected: pageIndex == 2 ? true : false,
                  ),
                  DetailedPageElevatedButton(
                    title: 'مرتجعات',
                    ontap: () => _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut),
                    isSelected: pageIndex == 1 ? true : false,
                  ),
                  DetailedPageElevatedButton(
                    title: 'مدفوعات',
                    ontap: () => _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut),
                    isSelected: pageIndex == 0 ? true : false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          height: 330.h,
          width: double.infinity,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            controller: _pageController,
            children: [
               FutureBuilder(
                future: MainCubit.get(context).getClientDof3at(clientId: widget.id),
                builder:(context,snapshot){
                if (snapshot.hasData) {
                  
                return ClientTransactionsPage(trxList: snapshot.data as List,);}
                else{return Center(child: CircularProgressIndicator(),);}}),
               StreamBuilder(
                  stream: MainCubit.get(context)
                      .getClientReturns(clientId: widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot data = snapshot.data as QuerySnapshot;
                      return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) => MiniReturn(returnDetailes: data.docs[index]));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              // ListView.builder(
              //     itemCount:
              //         BlocProvider.of<MainCubit>(context).clientReturns!.length,
              //     itemBuilder: (context, index) => Text('data')),
              // VisitsTile2Builder(
              //   id: widget.id,
              // ),
              StreamBuilder(
                  stream: MainCubit.get(context)
                      .getClientVisits(clientId: widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot data = snapshot.data as QuerySnapshot;
                      return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) => VisitsTile2(visitDetailes: data.docs[index]));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              StreamBuilder(
                  stream: MainCubit.get(context)
                      .getClientReceipt(clientId: widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot data = snapshot.data as QuerySnapshot;
                      return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) => MiniReceipt(
                        rId:  data.docs[index].id,              
                                clientId: widget.id,
                                clientName: widget.clientDetailes['name'],
                                price: data.docs[index]['price'],
                                receiptid: data.docs[index]['id'],
                                receiptDetailes: data.docs[index],
                              ));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              ClientOverView(
                clientDetailes: widget.clientDetailes,
              ),
            ],
          ),
        )
      ],
    );
  }
}
