import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'SharedPreferences Demo',
      home: const SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  String _username = '';
  bool _rememberMe = false;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  void _loadInputPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('username')) {
      setState(() {
        _username = prefs.getString('username')!;
      });
    }
    if (prefs.containsKey('rememberMe')) {
      setState(() {
        _rememberMe = prefs.getBool('rememberMe')!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadInputPreferences();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                ),
                controller: TextEditingController(text: _username),
                onChanged: (value) => _username = value,
              ),
              CheckboxListTile(
                title: const Text('Remember me'),
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              ElevatedButton(
                // Cambiar RaisedButton por ElevatedButton
                child: const Text('Save'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  if (_rememberMe == true) {
                    prefs.setString('username', _username);
                    prefs.setBool('rememberMe', _rememberMe);
                  }
                },
              ),
              const SizedBox(height: 250),
              FutureBuilder<int>(
                future: _counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                          'This should persist across restarts.',
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
