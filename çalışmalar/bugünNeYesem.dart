import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Bugün Ne Ismarlıyım krassl?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;

  int tatliNo = 1;

  int yemekNo = 1;

  List<String> corbaAdlari = [
    'Mercimek',
    'Tarhana',
    'TavukSuyu',
    'Düğün',
    'Yoğurtlu'
  ];
  List<String> tatliAdlari = [
    'Merve1',
    'Merve2',
    'Merve3',
    'Merve4',
    'Merve5',
  ];

  List<String> yemekAdlari = [
    'Kaynıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Köfte'
  ];

  void random() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  random();
                  print("corbaNo: $corbaNo");
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          Container(
            width: 250,
            child: const Divider(
              height: 4,
              color: Colors.cyan,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  random();
                  print("tatliNo: $tatliNo");
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Image.asset('assets/images/yemek_$yemekNo.jpg'),
              ),
            ),
          ),
          Text(
            yemekAdlari[yemekNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          Container(
            width: 250,
            child: const Divider(
              height: 4,
              color: Colors.cyan,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: random,
                child: Image.asset('assets/images/tatli_$tatliNo.jpg'),
              ),
            ),
          ),
          Text(
            tatliAdlari[tatliNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          Container(
            width: 250,
            child: const Divider(
              height: 4,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
