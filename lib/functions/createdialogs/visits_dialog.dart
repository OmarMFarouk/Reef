import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> visitsCreateDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(
        child: Text(
          'انشاء زياره',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40,
            top: -100,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close),
              ),
            ),
          ),
          SizedBox(
            width: 300.w,
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('العميل'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('تاريخ الانشاء'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('تاريخ و وقت الزياره'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('نوع الزياره'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('الموقع'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('غرض الزياره'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            onPressed: () {},
                            child: const Text(
                              'اعتماد',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.red)),
                            child: const Text(
                              'خانه جديده',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Expanded(
            //           child: ListView(
            //         children: [
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child: CustomTextField(title: 'العميل')),
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child: CustomTextField(title: 'تاريخ الانشاء')),
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child:
            //                   CustomTextField(title: 'تاريخ و\n وقت الزياره')),
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child: CustomTextField(title: 'نوع الزياره')),
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child: CustomTextField(title: 'الموقع')),
            //           const Padding(
            //               padding: EdgeInsets.all(8),
            //               child: CustomTextField(title: 'غرض الزياره')),
            //           FatoraButton(
            //               title: 'انشاء الزيارة',
            //               color: Colors.red,
            //               ontap: () {})
            //         ],
            //       )),
            //     );
            //   },
            // );
          
