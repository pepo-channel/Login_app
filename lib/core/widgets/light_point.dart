
import 'package:flutter/material.dart';

class LightPoint extends StatelessWidget {
  const LightPoint({
    super.key, required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            const Color.fromARGB(0, 0, 0, 0),
          ],
          stops: [0.2, 0.4],
          radius: 0.9,
        ),
      ),
    );
  }
}