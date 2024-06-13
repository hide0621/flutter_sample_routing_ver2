import 'package:flutter/material.dart';

void main() {
  // runApp(
  //   MaterialApp(initialRoute: '/', routes: {
  //     '/': (context) => const FirstScreen(),
  //     '/second': (context) => const SecondScreen(),
  //     '/second/third': (context) => const ThirdScreen(),
  //   }),
  // );
  runApp(
    MaterialApp(initialRoute: '/second/third', routes: {
      '/': (context) => const FirstScreen(),
      '/second': (context) => const SecondScreen(),
      '/second/third': (context) => const ThirdScreen(),
    }),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FirstScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('FirstからSecondへ'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
            ),
            ElevatedButton(
              child: const Text('FirstからThirdへ'),
              onPressed: () {
                // ルートがthirdの場合、中間のsecondは表示されないので注意
                Navigator.of(context).pushNamed('/second/third');
              },
            ),
          ],
        )));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SecondScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('SecondからThirdへ'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second/third');
              },
            ),
            ElevatedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )));
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ThirdScreen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )));
  }
}
