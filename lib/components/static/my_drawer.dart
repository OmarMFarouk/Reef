import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:erp12k/src/sign/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40.h,
              child: ListTile(
                trailing: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primary,
                ),
                title:   FutureBuilder(future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)
                    {
                    return
                    Text(snapshot.data!['car'].toString(),textDirection: TextDirection.rtl,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,));
                  }else
                  {
                    return Text('');
                  }
                  } 
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      isOnline ? '  متصل' : '  Offilne',
                      textDirection: TextDirection.rtl,
                    ),
                    CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          isOnline ? Colors.green.shade700 : Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       DrawerTile(
            //           onTap: () => visitsCreateDialog(context),
            //           title: 'انشاء زيارة'),
            //       DrawerTile(
            //           onTap: () => (context),
            //           title: 'انشاء عميل'),
            //       DrawerTile(
            //           onTap: () => AppNavigation.push(context,ReceiptCreatePage()),
            //           title: 'انشاء فاتورة'),
            //       DrawerTile(
            //           onTap: () => transactionsDialog(context),
            //           title: 'طلب تحويل'),
            //       DrawerTile(
            //           onTap: () => returnDialog(context),
            //           title: 'انشاء مرتجع'),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () async{await FirebaseAuth.instance.signOut();
                        AppNavigation.pushR(context, const LoginScreen());},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
