import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/functions/createdialogs/visits_dialog.dart';
import 'package:flutter/material.dart';

class FormDialogButton extends StatelessWidget {
  const FormDialogButton({
    super.key,
    required GlobalKey<FormState> formKey,
  });

  @override
  Widget build(BuildContext context) {
    return FatoraButton(
        title: 'انشاء زيارة',
        color: Colors.red,
        ontap: () {
          visitsCreateDialog(context);
        });
  }
}
