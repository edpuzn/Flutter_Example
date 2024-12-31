import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/images/bilim.jpg'),
              ),
              const Text(
                'Yapay Zeka',
                style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              Text(
                'Daha iyi, En iyi',
                style: GoogleFonts.pacifico(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 200,
                child: const Divider(height: 15, color: Colors.white),
              ),
              const Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 45.0,
                ),
                color: Colors.indigo,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.cyanAccent,
                  ),
                  title: Text(
                    'edpuzn@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 45.0,
                ),
                color: Colors.indigo,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.cyanAccent,
                  ),
                  title: Text(
                    '+90 506 599 10 21',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
