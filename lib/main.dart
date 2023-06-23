import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marvel_api/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Studio',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder<List<dynamic>>(
        future: fetchNowPlayingMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las películas'));
          } else {
            final List? movies = snapshot.data;
            return HomePage(movies: movies);
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> fetchNowPlayingMovies() async {
  const String apiKey = '9392e10a37d1230ac976b935ec5fd467';
  const String url =
      'https://api.themoviedb.org/3/movie/now_playing?language=es-ES&page=1&api_key=$apiKey';

  final response = await http.get(Uri.parse(url));
  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> movies = data['results'];
    return movies;
  } else {
    throw Exception('Error al cargar las películas');
  }
}
