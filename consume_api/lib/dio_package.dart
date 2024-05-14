import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioPackage extends StatefulWidget {
  const DioPackage({super.key});

  @override
  _DioPackageState createState() => _DioPackageState();
}

class _DioPackageState extends State<DioPackage> {
  String _breedName = '';
  String _description = '';

  Future<void> _fetchBreedInfo() async {
    try {
      // Crear instancia de Dio
      Dio dio = Dio();

      // Construir la URL de la consulta
      String url =
          'https://api.thecatapi.com/v1/breeds/search?name=$_breedName';

      // Realizar la solicitud GET
      Response response = await dio.get(url);

      // Extraer datos de la respuesta
      if (response.data.isNotEmpty) {
        setState(() {
          _description = response.data[0]['description'];
        });
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat API with Dio'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nombre de la raza',
                  helperText: 'Ingrese nombre',
                ),
                onChanged: (value) {
                  setState(() {
                    _breedName = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchBreedInfo,
                child: const Text('Buscar descripción'),
              ),
              const SizedBox(height: 20),
              _description.isNotEmpty
                  ? Text(_description)
                  : const Text('No se encontró descripción'),
            ],
          ),
        ),
      ),
    );
  }
}
