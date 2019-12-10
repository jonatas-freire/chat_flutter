import 'package:chat_online/components/ChatMessage.dart';
import 'package:chat_online/components/TextComposer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Grupo"),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          centerTitle: true,
          elevation: 0
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection("messages").snapshots(),
                  builder: (context, snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              List r = snapshot.data.documents.reversed.toList();
                              return ChatMessage(r[index].data);
                            }
                        );
                    }
                  }
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
