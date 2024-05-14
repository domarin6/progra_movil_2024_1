import 'package:consume_api/dio_package.dart';
import 'package:consume_api/http_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Difference between http & dio packages',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Http vs Dio'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HttpPackage()),
                    ),
                  );
                },
                child: const Text('HTTP'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const DioPackage()),
                    ),
                  );
                },
                child: const Text('DIO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
