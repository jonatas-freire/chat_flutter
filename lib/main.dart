
import 'package:chat_flutter/views/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(246, 246, 242, 1),
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
