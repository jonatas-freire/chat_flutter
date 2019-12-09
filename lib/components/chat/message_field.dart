import 'package:chat_flutter/components/my_text_field.dart';
import 'package:flutter/material.dart';

class MessageZone extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(100, 100, 100, 0.08),
            blurRadius: 2.0,
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          
            Padding(
              padding: const EdgeInsets.only( bottom: 12.0),
              child: Icon(
                Icons.insert_emoticon,
                color: Colors.lightBlue,
              ),
            ),
          
            Flexible(
              child: MyTextField(
                noBorder: 1,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hint: "Digite sua mensagem"
              ),
            ),
          
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(40),
              ),
          
              child: IconButton(
                iconSize: 20,
                color: Colors.white,
                icon: Icon(Icons.send),
                onPressed: () {
                  print("Jesus");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
