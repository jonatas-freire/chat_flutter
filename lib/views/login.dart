
import 'package:chat_flutter/components/register/form.dart';
import 'package:chat_flutter/components/shared/info_zone.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // CrossAxisAlignment.stretch
          children: <Widget>[
            InfoZone(
              subtitle: "Ao nosso chat",
              title: "Seja Bem vindo!"
            ),
            FormRegister()
          ],
        ),
      )
    );
  }
}