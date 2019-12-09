
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {

  
  final int typeField;
  final int maxLines;
  final TextInputType typeInput;
  final String hint;
  final String label;
  final int noBorder;
  final EdgeInsets padding; 
  final EdgeInsets margin;
  final Color background;
  final password;

   MyTextField({
    this.noBorder, 
    this.margin,
    this.typeField, 
    this.maxLines, 
    this.hint, 
    this.typeInput, 
    this.label,
    this.padding,
    this.background,
    this.password
  });

  @override
  State<StatefulWidget> createState(){
    return MyTextFieldState();

  }
}

class MyTextFieldState extends State<MyTextField>{

  FocusNode _focus = new FocusNode();
  int state = 0;

  @override
  void initState(){
    super.initState();
    _focus.addListener(_onFocusChange);
  }


// EdgeInsets.symmetric(horizontal: 10, vertical: 15)
  @override
  Widget build( BuildContext context ){
    return Container(
      margin: validateProps(widget.margin),
      decoration: BoxDecoration(
        color: validateProps(widget.background),
        borderRadius: BorderRadius.circular(5),
        border: Border.all( 
          color: changeColor(state),
        )
      ),
      child: TextField(
        focusNode: _focus,
        obscureText: widget.password != null ? true : false,
        maxLines: validateProps(widget.maxLines),
        minLines: 1,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: validateProps(widget.padding),
          border: InputBorder.none,
          hintText: validateProps(widget.hint),
          labelText: validateProps(widget.label)
        ),
      ),
    );
  }
  

  _onFocusChange(){
    if(_focus.hasFocus){
      setState(() {
        this.state = 1;  
      });
      
    }else{
      setState(() {
        this.state = 0;  
      });
    }
    
  }
  Color changeColor(state){
    print(state);
    switch(state){
      case 1:
        return Colors.lightBlue;
      break;
      case 2:
        return Colors.redAccent;
      break;
      default:
        return Colors.grey;
      break;
    }
  }
  validateProps(prop){
    return prop != null ? prop : null;
  }
}