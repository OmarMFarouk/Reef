import 'dart:developer';

import 'package:erp12k/Widgets/search_add_bar.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/components/tiles/visits_tile_2.dart';
import 'package:erp12k/functions/Filters/visit_filter_modal_sheet.dart';
import 'package:erp12k/screens/CreatesPage/visits_create_page.dart';
import 'package:erp12k/screens/home_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({
    super.key,
  });

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getAllVisits().whenComplete(() {
      setState(() {});
    });
    setState(() {});
    log(lastReceiptIndex.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text(
            'الزيارات',
            style: AppFonts.black,
          )),
      body: Column(
        children: [
          SearchAddBar(
            filter: () => visitFilterModalSheet(context),
          ),
          Expanded(
            child: BlocProvider.of<MainCubit>(context).allVisits!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        BlocProvider.of<MainCubit>(context).allVisits!.length,
                    itemBuilder: (context, index) => VisitsTile2(
                        visitDetailes: BlocProvider.of<MainCubit>(context)
                            .allVisits![index],
                      ),
                  ),
          ),
          // SizedBox(height: 20,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigation.push(context, VisitsCreatePage()),
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
