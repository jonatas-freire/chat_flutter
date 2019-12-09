import 'package:chat_flutter/components/my_text_field.dart';
import 'package:chat_flutter/views/chat.dart';
import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormRegisterState();
  }
}

class FormRegisterState extends State<FormRegister> {
  final EdgeInsets inputPadding = EdgeInsets.all(10);
  final EdgeInsets inputMargin = EdgeInsets.only(bottom: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(70, 94, 252, 1),
        ),
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(80))),
          child: Column(
            children: <Widget>[
              MyTextField(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                label: "Digite seu e-mail",
                padding: EdgeInsets.all(10),
              ),
              MyTextField(
                margin: EdgeInsets.only(bottom: 20),
                label: "Digite a sua senha",
                password: true,
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, 
                            MaterialPageRoute(builder: (context) {
                              return Chat();
                            },
                          ),
                        );
                      },
                      color: Colors.lightBlue,
                      padding:
                          EdgeInsets.all(15),
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Container(
                            margin: EdgeInsets.only( left: 10),
                            child: Icon( 
                              Icons.arrow_forward, 
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: FlatButton(
                      onPressed: () {
                          debugPrint("Clicou");
                        },
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20
                      ),
                      child: Text(
                          "Esqueci minha senha ?",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                    ),
                  ),
                ],
              ),
              
                  FlatButton(
                      onPressed: () {
                          debugPrint("Clicou");
                        },
                      padding: EdgeInsets.all(20),
                      child: Text(
                          "Crie sua conta!",
                          style: TextStyle(color: Colors.lightBlue, fontSize: 14),
                        ),
                    ),

            ],
          ),
        ));
  }
}
