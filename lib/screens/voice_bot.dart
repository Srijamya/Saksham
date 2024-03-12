import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class VoiceBot extends StatefulWidget {
  @override
  _VoiceBotState createState() => _VoiceBotState();
}

class _VoiceBotState extends State<VoiceBot> {
  @override
  TextEditingController textEditingController = TextEditingController();
  VoiceController controller = FlutterTextToSpeech.instance.voiceController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('VoiceBot'),
          flexibleSpace: Image(
            image: AssetImage('assets/images/top_header.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: textEditingController,
                  maxLines: 15,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Enter your message here',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.init().then((_) {
            controller.speak(textEditingController.text,
                VoiceControllerOptions(speechRate: 0.95, pitch: 2));
          }),
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.volume_up,
          ),
        ));
  }
}
