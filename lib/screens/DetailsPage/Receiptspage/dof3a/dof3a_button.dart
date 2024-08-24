import 'package:erp12k/screens/DetailsPage/Receiptspage/dof3a/dof3a_page.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';

class Dof3aButton extends StatelessWidget {
  Dof3aButton({super.key, required this.receiptDetails,this.disabled=false});
  final receiptDetails;
  bool disabled;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled? (){} : () => AppNavigation.push(
          context,
          Dof3aPage(
            receiptDetails: receiptDetails,
          )),
      style: ButtonStyle(
        backgroundColor:  WidgetStatePropertyAll(disabled?Colors.grey: Colors.blue),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: const Text(
        'اضافة دفعة',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
