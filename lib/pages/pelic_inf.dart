// Pantalla de Detalles o Informacion.
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/extensions/extensions.dart';
import 'package:marvel_api/widgets/custom_image.dart';
import 'package:marvel_api/widgets/padding.dart';
import 'package:marvel_api/widgets/shop_icon.dart';

class PelicInforDetail extends StatelessWidget {
  const PelicInforDetail({super.key, required String overview});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // Parte superior
        backgroundColor: themeData.scaffoldBackgroundColor,
        shadowColor: Colors.white.withOpacity(0),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [const ShopIcon(), 20.eh],
      ),
      body: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                // La imagen
                width: 250,
                child: CustomImage(child: Image.asset('assets/avengers.jpg'))),
            15.ev,
            const Text(
              // Titulo
              'Avengers: Endgame',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            15.ev,
            Row(
              // La valoracion
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '5',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                15.eh,
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
              ],
            ),
            30.ev,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    // La signosis o Resumen
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    text:
                        '''Después de los eventos devastadores de 'Vengadores: Infinity War', el universo está en ruinas debido a las acciones de Thanos. Con la ayuda de los aliados que quedaron, los Vengadores deberán reunirse una vez más para intentar deshacer sus acciones y restaurar el orden en el universo de una vez por todas, sin importar cuáles sean las consecuencias... Cuarta y última entrega de la saga "Vengadores".''',
                  ),
                  TextSpan(
                    text: '  ver variantes de portadas   ➡',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('Mas información'),
                  ),
                ],
              ),
            ),
            30.ev,
            Row(
              // Botones de la parte inferior
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cancelar',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(6),
                      shadowColor: MaterialStateProperty.all<Color>(
                          Colors.redAccent.shade700),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.redAccent.shade700),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Reproducir',
                          style: TextStyle(fontSize: 18),
                        ),
                        30.eh,
                        Icon(Icons.play_arrow_outlined),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
