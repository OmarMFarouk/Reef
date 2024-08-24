import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp12k/blocs/auth_bloc/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  logIn() async {
    emit(AuthLoading());
    await _auth
        .signInWithEmailAndPassword(
            email: emailCont.text, password: passwordCont.text)
        .whenComplete(() {
      if (_auth.currentUser != null) {
        emit(AuthSuccess());
        _store
            .collection('users')
            .doc(_auth.currentUser!.uid)
              .update({'last_login': Timestamp.now()});
        
      } else {
        emit(AuthError());
      }
    });
  }
}
