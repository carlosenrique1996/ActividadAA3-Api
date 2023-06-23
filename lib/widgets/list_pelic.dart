import 'package:flutter/material.dart';
import 'package:marvel_api/extensions/extensions.dart';
import 'package:marvel_api/pages/pelic_inf.dart';
import 'package:marvel_api/widgets/custom_image.dart';

class ListPelic extends StatelessWidget {
  const ListPelic({super.key, required this.imagen, required this.title});

  final String imagen;
  final String title;

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
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: CustomImage(
              child: Image.asset(imagen),
            ),
          ),
          5.ev,
          Text(
            title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
