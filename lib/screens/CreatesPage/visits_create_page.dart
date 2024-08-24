import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/components/Buttons/fatora_button.dart';
import 'package:erp12k/components/searchfields/client_search_field.dart';
import 'package:erp12k/screens/Pages/visit_page.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class VisitsCreatePage extends StatefulWidget {
  VisitsCreatePage({super.key});

  @override
  State<VisitsCreatePage> createState() => _VisitsCreatePageState();
}

class _VisitsCreatePageState extends State<VisitsCreatePage> {
  TextEditingController clientCont = TextEditingController();
  TextEditingController locationCont = TextEditingController();

  // String typeString = '';

  String _selectedDate = '';

  String _dateCount = '';

  String _range = '';

  String _rangeCount = '';
  DateRangePickerController date = DateRangePickerController();

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController dateCont = TextEditingController();
  TextEditingController visitReasonCont = TextEditingController();
  String visitType = '';

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateCont.text = selectedDate.toString().split(' ').first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'انشاء زيارة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: FutureBuilder(
                    future:
                        FirebaseFirestore.instance.collection('clients').get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        QuerySnapshot clientsData =
                            snapshot.data as QuerySnapshot;

                        return ClientSearchField(
                          controller: clientCont,
                          type: 'client',
                          data: clientsData.docs,
                          title: 'العميل',
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                enabled: false,
                initialValue: DateTime.now().toString().split(' ').first,
                decoration: InputDecoration(
                    label: const Text('تاريخ الانشاء'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                readOnly: true,
                controller: dateCont,
                onTap: () => _showDatePicker(context),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    label: const Text('تاريخ و وقت الزياره'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'نوع الزيارة',
                  contentPadding: const EdgeInsets.all(10),
                ),
                // value: 'test',
                items: const [
                  DropdownMenuItem(
                    value: 'تحصيل',
                    child: Text('تحصيل'),
                  ),
                  DropdownMenuItem(
                    value: 'توريد',
                    child: Text('توريد'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    visitType = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: locationCont,
                decoration: InputDecoration(
                    label: const Text('الموقع'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: visitReasonCont,
                decoration: InputDecoration(
                    label: const Text('غرض الزياره'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            FatoraButton(
              title: 'تاكيد',
              color: AppColors.primary,
              ontap: () async {
                if (clientCont.text.isNotEmpty &&
                    dateCont.text.isNotEmpty &&
                    visitReasonCont.text.isNotEmpty &&
                    visitType.isNotEmpty) {
                  final existingDocumentRef =
                      FirebaseFirestore.instance.collection('vars').doc('id');

                  // Retrieve the field value from the existing document
                  final documentSnapshot = await existingDocumentRef.get();

                  final fieldValue = documentSnapshot.data()!['visits'];
                  FirebaseFirestore.instance
                      .collection('clients')
                      .doc(recentClientId)
                      .collection('visits')
                      .add({
                    'client_name': recentClientName,
                    'client_id': recentClientId,
                    'date': dateCont.text,
                    'location': locationCont.text,
                    'type': visitType,
                    'reason': visitReasonCont.text,
                    'id': "#V$fieldValue",
                    // 'date':
                    //     DateFormat.yMEd().format(DateTime.now()).toString()
                  });
                  await FirebaseFirestore.instance
                      .collection('vars')
                      .doc('id')
                      .update({'visits': FieldValue.increment(1)});
                  AppNavigation.pop(context);
                  AppNavigation.pop(context);
                  AppNavigation.push(context, const VisitPage());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('تم انشاء مرتجع'),
                    backgroundColor: Colors.green,
                  ));
                  // BlocProvider.of<MainCubit>(context).getAllVisits();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
