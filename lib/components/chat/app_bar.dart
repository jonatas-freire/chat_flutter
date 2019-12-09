

import 'package:flutter/material.dart';

class MessageAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new AppBar(
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
      );
  }

}