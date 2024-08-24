import 'package:erp12k/src/styles.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer(
      {super.key,
      required this.title,
      required this.color,
      required this.memos});
  final String title;
  final Color color;
  final List memos;
  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      initiallyExpanded: true,
      titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: SizedBox(
            height: 30.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStatePropertyAll(color)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
        child: Container(
          decoration: BoxDecoration(
              color: color.withAlpha(50),
              // border: Border.all(color: color, width: 4),
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 300.h,
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: memos.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 88.w,
                    child: Text(
                      memos[index]['date'],
                      style: AppFonts.black,
                    )),
                SizedBox(
                  width: 200.w,
                  child: Text(memos[index]['text'],
                      textDirection: TextDirection.rtl, style: AppFonts.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
