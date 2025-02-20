import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final oynatici = AudioCache();

  void sesiCal(String ses) {
    final player = AudioPlayer();
    player.play(AssetSource('sounds/$ses.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('bongo', Colors.blueAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('bip', Colors.redAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap1', Colors.purpleAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('clap2', Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap3', Colors.orangeAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('crash', Colors.cyanAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('how', Colors.pinkAccent),
                  ),
                  Expanded(
                    child: buildDrumPad('ridebel', Colors.brown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FilledButton buildDrumPad(String ses, Color renk) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: renk,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        sesiCal(ses);
      },
      child: SizedBox.expand(),
    );
  }
}
