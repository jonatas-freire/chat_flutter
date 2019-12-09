import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final bool sender;

  MessageCard({this.message, this.sender});

  Widget build(BuildContext context) {
    return Container(
      alignment: sender ? Alignment.topRight : Alignment.topLeft,
      child: Card(
        color: Color.fromRGBO(239, 241, 245, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: isRecived(),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text("$message"),
            ],
          ),
        ),
      ),
    );
  }


  BorderRadius isRecived(){
    Radius raio = new Radius.circular(15);
    if(this.sender){
      return BorderRadius.only( topLeft: raio, bottomLeft: raio, bottomRight: raio );
    }
    return BorderRadius.only( topRight: raio, bottomLeft: raio, bottomRight: raio );
  }
}
