import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class ClientSearchField extends StatefulWidget {
  const ClientSearchField(
      {super.key,
      required this.title,
      required this.data,
      required this.type,
      required this.controller});
  final String title;
  final List data;
  final String type;
  final TextEditingController controller;
  @override
  State<ClientSearchField> createState() => _ClientSearchFieldState();
}

class _ClientSearchFieldState extends State<ClientSearchField> {
  final List<dynamic> suggestions = [];

  @override
  void initState() {
    super.initState();
    if (widget.type == 'product') {
      for (var element in widget.data) {
        suggestions.add(ProductModel.fromJson(element));
      }
    } else if (widget.type == 'client') {
      for (var element in widget.data) {
        suggestions.add(UserModel.fromJson(element));
      }
    } else if (widget.type == 'variables') {
      for (var element in widget.data) {
        suggestions.add(VariablesModel.fromJson(element));
      }
    } else if (widget.type == 'comp_product') {
      for (var element in widget.data) {
        suggestions.add(CompProductModel.fromJson(element));
      }
    } else if (widget.type == 'car') {
      for (var element in widget.data) {
        suggestions.add(CarModel.fromJson(element));
      }
    }
  }

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return SearchField(
        onSubmit: (p0) {
          setState(() {});
        },
        onSaved: (p0) {
          setState(() {});
        },
        onTap: () {
          setState(() {});
        },
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

        onSuggestionTap: widget.type == 'client'
            ? (p0) {
                UserModel userModel = p0.item as UserModel;
                recentClientId = userModel.id;
                recentClientName = userModel.name;
              }
            : widget.type == 'product'
                ? (p0) {
                    ProductModel productModel = p0.item as ProductModel;
                    recentItemPrice = productModel.price;
                    recentItemQuantity = productModel.quantity;
                    recentPickedItem = productModel;
                  }
                : widget.type == 'comp_product'
                    ? (p0) {
                        CompProductModel compProductModel =
                            p0.item as CompProductModel;
                        recentItemPrice = compProductModel.price;
                      }
                    : widget.type == 'car'
                        ? (p0) {
                            CarModel car = p0.item as CarModel;
                            recentCar = car.car;
                            recentDriver = car.name;
                            recentDriverID = car.id;
                          }
                        : null,
        controller: widget.controller,
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
        suggestions: suggestions
            .map((e) => widget.type == 'client'
                ? SearchFieldListItem<UserModel>(e.name,
                    item: e,
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(e.name),
                          Text(e.phone1),
                        ],
                      ),
                    ))
                : widget.type == 'variables'
                    ? SearchFieldListItem<VariablesModel>(e.text,
                        child: ListTile(
                          title: Text(e.text),
                        ))
                    : widget.type == 'comp_product'
                        ? SearchFieldListItem<CompProductModel>(e.name,
                            item: e,
                            child: ListTile(
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(e.name),
                                  Text(e.price.toString()),
                                ],
                              ),
                            ))
                        : widget.type == 'car'
                            ? SearchFieldListItem<CarModel>(e.car,
                                item: e,
                                child: ListTile(
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(e.name),
                                      Text(e.car.toString()),
                                    ],
                                  ),
                                ))
                            : SearchFieldListItem<ProductModel>(e.name,
                                item: e,
                                child: ListTile(
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(e.name),
                                      Text(e.quantity.toString()),
                                    ],
                                  ),
                                )))
            .toList());
  }
}

ProductModel? recentPickedItem;
String recentClientId = '';
String recentClientName = '';
double recentItemPrice = 0;
String recentDriver = '';
String recentDriverID = '';
String recentCar = '';
int recentItemQuantity = 0;

class UserModel {
  final String phone1;
  final String name;
  final String id;

  UserModel({required this.phone1, required this.name, required this.id});

  factory UserModel.fromJson(dynamic json) {
    return UserModel(name: json['name'], phone1: json['phone1'], id: json.id);
  }
}

class CarModel {
  final String car;
  final String name;
  final String id;

  CarModel({required this.car, required this.name, required this.id});

  factory CarModel.fromJson(dynamic json) {
    return CarModel(name: json['name'], car: json['car'], id: json.id);
  }
}

class ProductModel {
  final String name;
  final String docId;
  final String productId;
  final int quantity;
  final double price;

  ProductModel(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.docId,
      required this.productId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['doc_id'] = docId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      docId: json.id,
      productId: json['product_id'],
      name: json['name'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
    );
  }
}

class CompProductModel {
  final String name;
  final double price;
  CompProductModel({required this.name, required this.price});

  factory CompProductModel.fromJson(dynamic json) {
    return CompProductModel(
      name: json['name'],
      price: double.parse(json['price'].toString()),
    );
  }
}

class VariablesModel {
  final String category;
  final String text;

  VariablesModel({required this.category, required this.text});

  factory VariablesModel.fromJson(dynamic json) {
    return VariablesModel(
      category: json['category'],
      text: json['text'],
    );
  }
}
