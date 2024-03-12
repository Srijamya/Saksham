import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutterocr/screens/read_easy.dart';
import 'package:flutterocr/screens/listen_freely.dart';
import 'package:flutterocr/screens/voice_bot.dart';
import 'package:flutterocr/widgets/selection.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saksham'),
          flexibleSpace: Image(
            image: AssetImage('assets/images/top_header.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: [
              const SizedBox(
                height: 70,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 1000),
                child: Text('What do you need',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      selection(
                        image: 'assets/images/read.jpg',
                        title: 'ReadEasy',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadEasy()));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      selection(
                        image: 'assets/images/listen3.png',
                        title: 'ListenFreely',
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListenFreely()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      selection(
                        image: 'assets/images/voice.png',
                        title: 'VoiceBot',
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VoiceBot()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  selection(
                    image: 'assets/images/map.png',
                    title: 'Buffer',
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Problem_description(
                                image: 'assets/images/setting.png',
                                title: 'Buffer',
                              )));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  selection(
                    image: 'assets/images/setting.png',
                    title: 'Settings',
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Problem_description(
                                image: 'assets/images/setting.png',
                                title: 'Settings',
                              )));
                    },
                  ),
                ],
              ),*/
                ],
              ),
            ]),
          ),
        ));
  }
}
