
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {

  String nmUser = "";
  String cdEmail = "";
  String cdPassword = "";
  
  User({ 
    this.nmUser,
    this.cdEmail,
    this.cdPassword  
  });

  createUser({String cdEmail, String nmUser, String cdPassword}) async {
    if(nmUser == '' || cdEmail == '' || cdPassword == ''  ){
      return "Os campos devem está preenchidos";
    }

    DocumentSnapshot user = await Firestore
                            .instance
                            .collection('user')
                            .document("$cdEmail").get();
    
    if(user.data != null){
      return "Esse e-mail já está cadastrado no sistema";
    }

    FirebaseUser userAuth = ( await FirebaseAuth.instance
                                .createUserWithEmailAndPassword( 
                                  email: cdEmail, 
                                  password: cdPassword 
                                )
                              );
                              
    print(userAuth.user);

    return userAuth;
  }

  bool loginUser(){
    return false;
  }

  bool getUser(){
    return false;
  }

  bool addContact(){
    return false;
  }

}