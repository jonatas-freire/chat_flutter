

import 'package:chat_flutter/components/chat/message_card.dart';
import 'package:chat_flutter/components/chat/message_field.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 75),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MessageCard(
                message: "Eu consegui fazer esse layout",
                sender: true,
                
              ),
              MessageCard(
                message: "Mas, ainda falta muita coisa",
                sender: false,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("José Gomes"),
            Text("Online", 
              style: TextStyle(
                fontSize: 12, 
                color: Color.fromRGBO(153, 153, 153, 1),
                fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.people_outline, 
              color: Colors.lightBlue,
            ),
            onPressed: (){ 
              print("Uma função ai");
            },  
          )
        ],
      ),
      bottomSheet: MessageZone(),
    );
  }
}
