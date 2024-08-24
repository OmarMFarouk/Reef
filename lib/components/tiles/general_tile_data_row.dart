import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTileDataRow extends StatelessWidget {
  const GeneralTileDataRow({
    super.key,
    required this.icon,
    required this.data,
    this.textcolor = Colors.black,
    this.iconcolor = Colors.black,
  });
  final IconData icon;
  final String data;
  final Color textcolor;
  final Color iconcolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,
              data,
              style: TextStyle(color: textcolor),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Icon(icon,color: iconcolor,),
        ],
      ),
    );
  }
}
