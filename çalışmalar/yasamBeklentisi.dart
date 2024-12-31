import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan,
        primaryColor: Colors.cyan,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  int kilo = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('Boy'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('Kilo'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Haftada Kaç defa Spor Yapıyorsunuz?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${yapilanSpor.round()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: yapilanSpor,
                      onChanged: (double newValue) {
                        setState(() {
                          yapilanSpor = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${icilenSigara.round()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                      min: 0,
                      max: 30,
                      divisions: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'Kadın';
                      });
                    },
                    renk: seciliCinsiyet == "Kadın"
                        ? Colors.lightBlue
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'Kadın',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'Erkek';
                      });
                    },
                    renk: seciliCinsiyet == "Erkek"
                        ? Colors.lightBlue
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'Erkek',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    UserData(
                      kilo: kilo,
                      boy: boy,
                      seciliCinsiyet: seciliCinsiyet ?? 'Erkek',
                      yapilanSpor: yapilanSpor,
                      icilenSigara: icilenSigara,
                    ),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text('Hesapla'),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: MetinStili,
            )),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == 'Boy' ? boy.toString() : kilo.toString(),
              style: SayiStili,
            )),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'Boy' ? boy++ : kilo++;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.lightBlue),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Kare köşeler
                ),
              ),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'Boy' ? boy-- : kilo--;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.lightBlue),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Kare köşeler
                ),
              ),
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;

  IconCinsiyet({
    required this.cinsiyet,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final VoidCallback? onPress;

  MyContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}

TextStyle MetinStili = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle SayiStili = const TextStyle(
  color: Colors.black,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    double yasamBeklentisi = Hesap(_userData).hesaplama();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuç Sayfası'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Beklenen Yaşam Süresi: ${yasamBeklentisi.round()} yıl',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Geri Dön!'),
            ),
          ),
        ],
      ),
    );
  }
}

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;

    sonuc = 90 + _userData.yapilanSpor - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);

    return _userData.seciliCinsiyet == 'Kadın' ? sonuc + 3 : sonuc;
  }
}

class UserData {
  final String seciliCinsiyet;
  final double icilenSigara;
  final double yapilanSpor;
  final int boy;
  final int kilo;

  UserData({
    required this.seciliCinsiyet,
    required this.icilenSigara,
    required this.yapilanSpor,
    required this.kilo,
    required this.boy,
  });
}
