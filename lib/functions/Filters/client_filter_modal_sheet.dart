import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> clientFilterModalSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
          width: 200.w,
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Filter By',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.green.shade300)),
                child: Text(
                  'New',
                  style: TextStyle(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.red.shade300)),
                child: Text(
                  '2023',
                  style: TextStyle(
                      color: Colors.red.shade900, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.purple.shade300)),
                child: Text(
                  '2022',
                  style: TextStyle(
                      color: Colors.purple.shade900, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.teal.shade300)),
                child: Text(
                  'Old -> 2021',
                  style: TextStyle(
                      color: Colors.teal.shade900, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ));
    },
  );
}
