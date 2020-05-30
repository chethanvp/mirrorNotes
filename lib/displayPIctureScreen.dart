import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_editor_pro/image_editor_pro.dart';


class DisplayPictureScreen extends StatefulWidget{

   final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);


  @override
  _DisplayPictureScreen createState() => _DisplayPictureScreen();
}

class _DisplayPictureScreen extends State<DisplayPictureScreen>{

  
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.file(File(widget.imagePath)) ,
          RaisedButton(onPressed: (){

          }, child: Text("save"),)
        ],
      )
    );
  }
}