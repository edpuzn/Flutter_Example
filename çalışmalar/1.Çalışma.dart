import 'package:flutter/material.dart';

void deneme() {
  runApp(Deneme());
}

class Deneme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // width: 200,
              height: 100,
              color: Colors.red,
              child: Text('1.Container'),
            ),
            const SizedBox(
              height: 30,
              width: 20,
            ),
            Container(
              // width: 200,
              height: 100,
              color: Colors.blue,
              child: Text('2.Container'),
            ),
            const SizedBox(
              height: 30,
              width: 20,
            ),
            Container(
              // width: 200,
              height: 100,
              color: Colors.yellow,
              child: const Text('3.Container'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.purple,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
