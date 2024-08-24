import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import 'package:erp12k/src/receipt_data_example.dart';

class ReceiptSearchField extends StatefulWidget {
  const ReceiptSearchField({super.key, required this.title});
  final String title;
  @override
  State<ReceiptSearchField> createState() => _ReceiptSearchFieldState();
}

class _ReceiptSearchFieldState extends State<ReceiptSearchField> {
  final List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    for (var element in Receipts_data) {
      users.add(UserModel.fromJson(element));
    }
  }

  // ignore: non_constant_identifier_names
  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SearchField<UserModel>(
        searchStyle: const TextStyle(fontSize: 15),
        maxSuggestionsInViewPort: 5,
        itemHeight: 80,
        suggestionsDecoration: SuggestionDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8),
          ),
          border: Border.all(
            color: Colors.blue.shade900,
          ),
        ),
        // initialValue: SearchFieldListItem<UserModel>(
        //   users[2].name,
        //   child: Container(
        //     color: Colors.red,
        //     width: 100,
        //     alignment: Alignment.center,
        //     child: Text(
        //       users[2].name,
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        controller: SearchController,
        textAlign: TextAlign.right,
        suggestionItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1.0)),
        //          decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        searchInputDecoration: InputDecoration(
          labelText: widget.title,
          // filled: true,
          // fillColor: Colors.grey.withOpacity(0.2),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     color: Colors.white,
          //     width: 2.0,
          //   ),
          //   borderRadius: BorderRadius.circular(8.0),
          // ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        marginColor: Colors.grey.shade300,
        // onSuggestionTap: (p0) => {
        //       setState(() {
        //         SearchController.text =
        //             p0.searchKey.split(',')[1].replaceFirst('[', '');

        //         // SearchController. = p0.searchKey.split(',')[0].replaceFirst('[', '');
        //       })
        //     },
        // onSuggestionTap: (p0)=>{ SearchController.text = "asdsad"},
        suggestions: users
            .map((e) => SearchFieldListItem<UserModel>(e.rid,
                child: UserTile(user: e)))
            .toList());
  }
}

class UserTile extends StatelessWidget {
  final UserModel user;

  // ignore: use_super_parameters
  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              Text(user.price,style: TextStyle(color: Colors.green.shade800),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(user.rid,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text(user.name),
            ],
          ),
        ],
      ),
    );
  }
}

class UserModel {
  final int id;
  final String rid;
  final String name;
  final String searchdata;
  final String price;

  UserModel({
    required this.searchdata,
    required this.id,
    required this.name,
    required this.price,
    required this.rid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      price: json['price'],
      searchdata: json['searchdata'].toString(),
      id: json['id'],
      name: json['name'],
      rid: json['Rid'],
    );
  }
}
