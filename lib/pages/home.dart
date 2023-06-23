import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/extensions/extensions.dart';
import 'dart:convert';

import '../widgets/list_pelic.dart';
import '../widgets/list_row_pelic.dart';
import '../widgets/padding.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, List? movies}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchNowPlayingMovies();
  }

  Future<void> fetchNowPlayingMovies() async {
    final String apiKey = '9392e10a37d1230ac976b935ec5fd467'; // API key
    final String url =
        'https://api.themoviedb.org/3/movie/now_playing?language=es-ES&page=1&api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        movies = data['results'];
      });
    } else {
      throw Exception('Error al cargar las películas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPadding(
        child: Column(
          children: [
            kToolbarHeight.ev,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Text('FM'),
                    ),
                    15.eh,
                    const Text('Frans Montoya')
                  ],
                ),
                const Icon(
                  Icons.search,
                  size: 28,
                )
              ],
            ),
            30.ev,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Destacados de hoy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Ver todo',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            15.ev,
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const ListPelic(
                    imagen: 'assets/Venom.jpg',
                    title: 'Venom Liberado',
                  ),
                  20.eh,
                  const ListPelic(
                    imagen: 'assets/RR.FF.jpg',
                    title: 'Rápidos y furiosos X',
                  ),
                  20.eh,
                  const ListPelic(
                    imagen: 'assets/Dragon.jpg',
                    title: 'Dragon Ball Super',
                  ),
                  20.eh,
                  const ListPelic(
                    imagen: 'assets/avengers.jpg',
                    title: 'Avengers: Endgame',
                  ),
                ],
              ),
            ),
            18.ev,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Las películas más populares',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Ver todo',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            15.ev,
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final title = movie['title'];
                  final rating = movie['vote_average'].toDouble();
                  final overview = movie['overview'];

                  return ListRowPelic(
                    date: DateTime.parse(movie['release_date']).toLocal().date,
                    imagen: 'assets/RR.FF.jpg',
                    rate: rating,
                    title: title,
                    play: 'Ver Ahora',
                    overview: overview, // Pasamos la sinopsis de la película
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
