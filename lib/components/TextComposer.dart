import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;


class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final _textController = TextEditingController();
  bool _isComposing = false;

  void _reset(){
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child:
                  IconButton(icon: Icon(Icons.photo_camera),
                      onPressed: () async {
                        await _ensureLoggedIn();
                        File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
                        if(imgFile == null) return;
                        StorageUploadTask task = FirebaseStorage.instance.ref().
                          child(googleSignIn.currentUser.id.toString() +
                            DateTime.now().millisecondsSinceEpoch.toString()).putFile(imgFile);
                        StorageTaskSnapshot snap = await task.onComplete;
                        _sendMessage(imgUrl: await snap.ref.getDownloadURL());
                      }),
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: (text){
                  _handleSubmitted(text);
                  _reset();
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                        child: Text("Enviar"),
                        onPressed: _isComposing ? () {
                          _handleSubmitted(_textController.text);
                          _reset();
                        } : null,
                      )
                    : IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _isComposing ? () {
                          _handleSubmitted(_textController.text);
                          _reset();
                        } : null,
                      ))
          ],
        ),
      ),
    );
  }

  _handleSubmitted(String text) async {
    await _ensureLoggedIn();
    _sendMessage(text: text);
  }

  void _sendMessage({String text, String imgUrl}){
    Firestore.instance.collection("messages").add(
        {
          "text" : text,
          "imgUrl" : imgUrl,
          "senderName" : googleSignIn.currentUser.displayName,
          "senderPhotoUrl" : googleSignIn.currentUser.photoUrl
        }
    );
  }

  Future<Null> _ensureLoggedIn() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if(user == null)
      user = await googleSignIn.signInSilently();
    if(user == null)
      user = await googleSignIn.signIn();
    if(await auth.currentUser() == null){
      GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
      await auth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: credentials.idToken, accessToken: credentials.accessToken));
    }
  }

}