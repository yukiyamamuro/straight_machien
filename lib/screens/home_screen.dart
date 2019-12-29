import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:soundpool/soundpool.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _text = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念でした",
    "不合格です",
    "頑張りましょう"
  ];

  List<int> _soundIds = [0, 0, 0, 0, 0, 0];
  Soundpool _soundpool;

  @override
  void initState() {
    super.initState();
    _initSounds();
    _soundpool = Soundpool();
  }

  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_text[0], _soundIds[0])),
                  Expanded(
                      flex: 1, child: _soundButton(_text[1], _soundIds[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_text[2], _soundIds[2])),
                  Expanded(
                      flex: 1, child: _soundButton(_text[3], _soundIds[3])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1, child: _soundButton(_text[4], _soundIds[4])),
                  Expanded(
                      flex: 1, child: _soundButton(_text[5], _soundIds[5])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String text, int soundId) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () => _playSound(soundId),
          child: Text(text),
        )
    );
  }

  Future<void> _initSounds() async {
    _soundpool = Soundpool();

    _soundIds[0] = await loadSound("assets/sounds/sound1.mp3");
    _soundIds[1] = await loadSound("assets/sounds/sound2.mp3");
    _soundIds[2] = await loadSound("assets/sounds/sound3.mp3");
    _soundIds[3] = await loadSound("assets/sounds/sound4.mp3");
    _soundIds[4] = await loadSound("assets/sounds/sound5.mp3");
    _soundIds[5] = await loadSound("assets/sounds/sound6.mp3");
    setState(() {

    });
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
  }

  void _playSound(int soundId) {
    _soundpool.play(soundId);
  }
}
