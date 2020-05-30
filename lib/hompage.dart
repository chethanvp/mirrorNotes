import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mirrornotes/camerapage.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String path;
  bool empty;
  CameraDescription camera;

  page() async {
    final p = await getApplicationDocumentsDirectory();
    String path = p.path;
    final dir = new Directory("$path/noteslist");
    dir.createSync(recursive: true);
    // dir.delete(recursive: false);
    if (dir.existsSync()) {
      print(dir.listSync().length);
      int fileListSize = dir.listSync().length;
      if (fileListSize == 0) {
        setState(() {
          empty = true;
        });
      }
      // else{
      //   return contentHomePage();
      // }
    }

    // Obtain a list of the available cameras on the device.
final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
final firstCamera = cameras.first;
setState(() {
  camera = firstCamera;
});

  }

  emptyHomePage() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Press ' "),
          Icon(Icons.add_a_photo),
          Text(" ' to Create Notes")
        ],
      ),
    );
  }

  createNewNotes(){
    print("switching to camerapage");
      Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage(camera: camera,)));
  }

  @override
  void initState() {
    super.initState();
    page();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mirror Notes"),
      ),
      body: empty == true ? emptyHomePage() : emptyHomePage(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: createNewNotes, 
          label: Icon(Icons.add_a_photo)
          ),
    );
  }
}
