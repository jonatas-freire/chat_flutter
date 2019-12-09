import 'package:flutter/material.dart';

class InfoZone extends StatelessWidget {
  final String title;
  final String subtitle;

  InfoZone({this.title, this.subtitle});

  final assetsImage = new AssetImage('assets/images/conversation.png');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Color.fromRGBO(70, 94, 252, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
        ),

      child: Column(
        children: <Widget>[
          Center(
            child: Image(
              image: assetsImage,
              width: 250,
              height: 250,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("$title",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Text("$subtitle",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
