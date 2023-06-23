import 'package:flutter/material.dart';

class ShopIcon extends StatelessWidget {
  const ShopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: const [
          Positioned(
            bottom: 18,
            right: 0,
            child: Icon(Icons.shopping_bag_outlined),
          ),
          Positioned(
            bottom: 18,
            right: 15,
            child: CircleAvatar(
              maxRadius: 5,
              backgroundColor: Colors.red,
              child: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
