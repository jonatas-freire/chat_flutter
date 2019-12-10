
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class User extends ChangeNotifier {

  String nmUser = "";
  String cdEmail = "";
  String cdPassword = "";
  
  User({ 
    this.nmUser,
    this.cdEmail,
    this.cdPassword  
  });

  Future<bool> loginUser({ String cdEmail, String cdPassword }) async {
    try{

      var userAuth = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(email: cdEmail, password: cdPassword);
      notifyListeners();
      String token = (await userAuth.getIdToken());
      print(token);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', token );

      return true;
    }catch(e){
      return false;
    }

  }

  createUser({String cdEmail, String nmUser, String cdPassword}) async {

    DocumentSnapshot hasUser = await Firestore
                            .instance
                            .collection('user')
                            .document("$cdEmail").get();
    
    if(hasUser.data != null){
      return "Esse e-mail já está cadastrado no sistema";
    }

    FirebaseUser userAuth = ( await FirebaseAuth.instance
                                .createUserWithEmailAndPassword( 
                                  email: cdEmail, 
                                  password: cdPassword 
                                )
                              );

    print(userAuth.getIdToken().toString());

    Firestore
      .instance
      .collection('user')
      .document("$cdEmail")
      .setData({ 
        "cdEmail" : "$cdEmail",
        "nmUser"  : "$nmUser"
      });

  }

  Future<List> getContact(List contactsList) async {
    Firestore.instance.collection("user")
    .snapshots().listen((snapshots) {
        for( DocumentSnapshot doc in snapshots.documents){
          print(doc.data);
          contactsList.add(doc);
        }
    });
    return contactsList;
  }

  bool addContact(){
    return false;
  }

}