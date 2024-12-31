import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Sayfalar Arası Geçiş / Navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HomePage'),
            ElevatedButton(
              child: const Text('Git -> Route Pink'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoutePink()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('Route Pink'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Şu an RoutePink en üstte'),
            ElevatedButton(
              child: const Text('Git -> Route Green'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteGreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Geri Dön'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Route Green'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Şu an RouteGreen en üstte'),
            ElevatedButton(
              child: const Text('Git -> Route Grey'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteGrey()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Geri Dön'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Route Grey'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Şu an RouteGrey en üstte'),
            ElevatedButton(
              child: const Text('Git -> ....'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('Geri Dön'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
