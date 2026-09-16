import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final String colorHex;
  final double size;

  const ColorDot({super.key, required this.colorHex, this.size = 12.0});

  Color _parseColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.tryParse(hex, radix: 16) ?? 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    final color = _parseColor(colorHex);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: const Color.fromARGB(25, 0, 0, 0), width: 1),
      ),
    );
  }
}
