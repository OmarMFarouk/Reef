import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/models/client_model.dart';
import 'package:erp12k/screens/CreatesPage/receipt_create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  TextEditingController namecont = TextEditingController();
  TextEditingController companyNamecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController phone1cont = TextEditingController();
  TextEditingController phone2cont = TextEditingController();
  TextEditingController addresscont = TextEditingController();
  TextEditingController areacont = TextEditingController();
  TextEditingController area2cont = TextEditingController();
  TextEditingController area3cont = TextEditingController();
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  List? clientReturns = [];
  List? clientDof3at = [];
  List? allVisits = [];
  List? allReceipts = [];
  List? allReturns = [];

  Stream getClient() {
    return _store.collection('clients').snapshots();
  }

  Future searchClient(clientUid) async {
    return await _store.collection('clients').doc(clientUid).get();
  }

  Future<void> varsChecker() async {
    // Replace with your collection and document paths
    final existingDocumentRef =
        FirebaseFirestore.instance.collection('vars').doc('id');

    // Retrieve the field value from the existing document
    final documentSnapshot = await existingDocumentRef.get();
    if (documentSnapshot.exists) {
      final fieldValue = documentSnapshot.data()![
          'visits']; // Replace 'fieldToRetrieve' with the actual field name

      // Create the new document with the retrieved field value
      return fieldValue;
    } else {
      print('Existing document not found');
    }
  }

  // Stream searchClient() {
  //   return _store.collection('clients').where().firestore.databaseId.length
  // }
  Future addDof3a({clientDoc, receiptDoc, method, price}) async {
    var query = await _store
        .collection('clients')
        .doc(clientDoc)
        .collection('receipts')
        .doc(receiptDoc)
        .update({
      'dof3a': FieldValue.arrayUnion([
        {
          'date': DateFormat.yMd().format(DateTime.now()).toString(),
          'price': price,
          'way': method
        }
      ])
    });
    await _store
        .collection('clients')
        .doc(clientDoc)
        .collection('receipts')
        .doc(receiptDoc)
        .update({
      'paid': FieldValue.increment(price),
      'remained': FieldValue.increment(-price)
    });
    getAllReceipts();
    emit(MainSuccess());
    return query;
  }

  void createClient(
      {required LatLng position,
      required String imagePath,
      address,
      city,
      government,
      placeMark}) {
    _store
        .collection('clients')
        .add(ClientModel(
          image: imagePath,
          name: namecont.text.trim(),
          companyName: companyNamecont.text.trim(),
          email: emailcont.text.trim(),
          phone1: phone1cont.text.trim(),
          phone2: phone2cont.text.trim(),
          address: address,
          area: city,
          area2: government,
          area3: placeMark,
          dateCreated: DateFormat.yMd().format(DateTime.now()).toString(),
          discount: 10,
          latitude: position.latitude,
          longitude: position.longitude,
        ).toJson())
        .then((r) {
      latestClientId = r.id;
      latestClientName = namecont.text;
    }).whenComplete(() {
      emit(MainSuccess());
      namecont.clear();
      companyNamecont.clear();
      emailcont.clear();
      phone1cont.clear();
      phone2cont.clear();
      addresscont.clear();
      areacont.clear();
      area2cont.clear();
      area3cont.clear();
    });
  }

  Stream getProduct() {
    return _store.collection('products').snapshots();
  }

  Stream getCarProduct() {
    return _store
        .collection('users')
        .doc('${FirebaseAuth.instance.currentUser?.uid}')
        .collection('products')
        .snapshots();
  }

  Stream getClientReceipt({required clientId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .snapshots();
  }

  Stream getReceipt({required clientId, required rId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .doc(rId)
        .collection('items')
        .snapshots();
  }

  Stream getReceiptItems({required clientId, required rId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .doc(rId)
        .collection('items')
        .snapshots();
  }

  Stream getReceiptReturns({required clientId, required rId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .doc(rId)
        .collection('returns')
        .snapshots();
  }

  Stream getReceiptDof3a({required clientId, required rId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .doc(rId)
        .collection('dof3a')
        .snapshots();
  }

  Stream getClientReturns({required clientId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('returns')
        .snapshots();
  }

  getClientDof3at({required clientId}) async {
    List sd = [];
    var query = await _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .get();
    for (var i = 0; i < query.docs.length; i++) {
      sd.addAll(query.docs[i]['dof3a']);
    }
    return sd;
  }

  getClientsTransactions({required clientId}) async {
    var query = await _store
        .collection('clients')
        .doc(clientId)
        .collection('receipts')
        .get();
    for (var i = 0; i < query.docs.length; i++) {
      var sd = await _store
          .collection('clients')
          .doc(clientId)
          .collection('receipts')
          .doc(query.docs[i].id)
          .collection('dof3a')
          .get();
      clientDof3at = sd.docs;
    }
  }

  Stream getClientVisits({required clientId}) {
    return _store
        .collection('clients')
        .doc(clientId)
        .collection('visits')
        .snapshots();
  }

  Future getAllVisits() async {
    // if(allVisits!.isNotEmpty){
    allVisits!.clear();
    // }
    var clientQuery = await _store.collection('clients').get();
    for (var i = 0; i < clientQuery.docs.length; i++) {
      var query = await _store
          .collection('clients')
          .doc(clientQuery.docs[i].id)
          .collection('visits')
          .get();
      allVisits!.addAll(query.docs);
    }
  }

  getAllReturns() async {
    var clientQuery = await _store.collection('clients').get();
    for (var i = 0; i < clientQuery.docs.length; i++) {
      var query = await _store
          .collection('clients')
          .doc(clientQuery.docs[i].id)
          .collection('returns')
          .get();
      allReturns!.addAll(query.docs);
    }
  }

  getAllReceipts() async {
    var clientQuery = await _store.collection('clients').get();
    for (var i = 0; i < clientQuery.docs.length; i++) {
      var query = await _store
          .collection('clients')
          .doc(clientQuery.docs[i].id)
          .collection('receipts')
          .get();
      allReceipts!.addAll(query.docs);
    }
  }

  getIds() async {
    var ids = await _store.collection('vars').doc('id').get();
    return ids;
  }
}
