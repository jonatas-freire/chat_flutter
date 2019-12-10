import 'package:chat_online/view/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  runApp(MyApp());
}

final ThemeData DefaultTheme = ThemeData(
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.orangeAccent[400],
);



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme,
      home: ChatScreen(),
    );
  }
}












