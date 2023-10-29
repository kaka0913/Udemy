//flutter
import 'package:flutter/material.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//domain
import 'package:test0805/domain/firestore_user.dart';


final signupProvider = ChangeNotifierProvider((ref) => SignupModel());

class SignupModel extends ChangeNotifier{
  int counter=0;
  User? currentUser;
  //auth
  String email ="";
  String password ="";
  bool isObscure = true;
  
  Future<void> createFirestoreUser({required BuildContext context,required String uid}) async {
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      createdAt: now,
        email: email,
        uid: uid,
        updatedAt: now,
        userName:"Alice",
    );
      final Map<String,dynamic> userData = firestoreUser.toJson();
      await FirebaseFirestore.instance.collection("users").doc(uid).set(userData);
      notifyListeners();
  }

  Future <void> createUser({required BuildContext context}) async {
      try{
        final result = await 
FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        final User? user = result.user;
        final String uid = user!.uid;
        await createFirestoreUser(context: context,uid: uid);
      } on FirebaseAuthException catch(e){
        debugPrint(e.toString());
      }
  }

  void toggleIsObscure(){
    isObscure = !isObscure;
    notifyListeners();
  }
}