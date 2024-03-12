import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class ReadEasy extends StatefulWidget {
  @override
  _ReadEasyState createState() => _ReadEasyState();
}

class _ReadEasyState extends State<ReadEasy> {
  bool _scanning = false;
  String _extractText = '';
  File? _pickedImage;
  VoiceController controller = FlutterTextToSpeech.instance.voiceController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Easy'),
        flexibleSpace: Image(
          image: AssetImage('assets/images/top_header.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          _pickedImage == null
              ? Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    size: 100,
                  ),
                )
              : Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: FileImage(_pickedImage!),
                        fit: BoxFit.fill,
                      )),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.image_search),
              onPressed: () async {
                setState(() {
                  _scanning = true;
                });
                _pickedImage =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                _extractText =
                    await TesseractOcr.extractText(_pickedImage?.path);
                setState(() {
                  _scanning = false;
                });
              },
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.camera_alt),
              onPressed: () async {
                setState(() {
                  _scanning = true;
                });
                _pickedImage =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                _extractText =
                    await TesseractOcr.extractText(_pickedImage?.path);
                setState(() {
                  _scanning = false;
                });
              },
            ),
          ),
          ]),
          SizedBox(height: 20),
          _scanning
              ? Center(child: CircularProgressIndicator())
              : Center(
            child: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
          child: Text(_extractText, style: TextStyle(color: Colors.black),),
        ),
      ),
          ),
          SizedBox(height: 20),
          
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.volume_up),
              onPressed: () => controller.init().then((_) {
            controller.speak(_extractText,
                VoiceControllerOptions(speechRate: 0.95, pitch: 2));
          }),
            ),
          ),
        ],
      ),
    );
  }
}
