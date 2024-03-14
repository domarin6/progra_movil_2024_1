import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout example'),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 30,
              width: double.infinity,
              color: Colors.amber,
      
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              height: 60,
              width: double.infinity,
              color: Colors.red,
              child: Container(
                width: double.infinity,
                height: 5,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
