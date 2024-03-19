import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:  Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/cc9e769a-cc2f-48b7-a028-bca8db4459ee/Derivates/355558f9-d1be-4cdb-b693-f481067610ed.jpg'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Strawberry Pavlova',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                  'Exercitation commodo aliqua laboris cupidatat ut mollit deserunt in pariatur minim. Magna aliquip exercitation labore eu sint. Esse pariatur occaecat enim nostrud tempor elit et et. Deserunt magna commodo sit ut laborum occaecat. Deserunt deserunt ullamco est in qui labore. Culpa labore adipisicing dolor irure cupidatat sint et in sint enim sint. Pariatur laborum quis commodo pariatur commodo.'),
            ),
          ],
        ));
  }
}
