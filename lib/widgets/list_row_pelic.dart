import 'package:flutter/material.dart';
import 'package:marvel_api/extensions/extensions.dart';
import 'package:marvel_api/pages/pelic_inf.dart';
import 'package:marvel_api/widgets/custom_image.dart';

class ListRowPelic extends StatelessWidget {
  final DateTime date;
  final String imagen;
  final double rate;
  final String title;
  final String play;
  final String overview;

  const ListRowPelic({
    super.key,
    required this.date,
    required this.imagen,
    required this.rate,
    required this.title,
    required this.play,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PelicInforDetail(
            overview: '',
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 140,
            child: CustomImage(
              child: Image.asset(imagen),
            ),
          ),
          15.eh,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.ev,
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
                10.ev,
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    10.eh,
                    Text(
                      rate.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                10.ev,
                Text(
                  'Estreno $date',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                10.ev,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      play,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_right_alt_sharp),
                  ],
                ),
                25.ev,
              ],
            ),
          )
        ],
      ),
    );
  }
}
