import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpPackage extends StatefulWidget {
  const HttpPackage({super.key});

  @override
  _HttpPackageState createState() => _HttpPackageState();
}

class _HttpPackageState extends State<HttpPackage> {
  String name = '';
  int id = 0;
  int height = 0;
  String image = '';

  @override
  void initState() {
    super.initState();

    // Hacemos una petición GET a la API PokeAPI para obtener la información de un Pokémon específico
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/144');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        // Parseamos la respuesta JSON
        var json = jsonDecode(response.body);

        // Actualizamos los valores de las variables
        name = json['name'];
        id = json['id'];
        height = json['height'];
        image = json['sprites']['front_default'];

        // Actualizamos el estado de la interfaz de usuario
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeApi with HTTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $name'),
            Text('ID: ${id.toString()}'),
            Text('Altura: ${height.toString()}'),
            image.isNotEmpty
                ? Image.network(image, scale: 0.6)
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
