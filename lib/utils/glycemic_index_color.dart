import 'package:flutter/material.dart';

mixin GlycemicIndexColor {
  Color getGIColor(String gi) {
    // N/A veya boş değerler için gri renk döndür
    if (gi == 'N/A' || gi.isEmpty) return Colors.grey;

    // Sayıya dönüştürülebiliyorsa renk ata
    final giValue = double.tryParse(gi);
    if (giValue == null) return Colors.grey;

    if (giValue <= 55) return Colors.green;
    if (giValue <= 69) return Colors.orange;
    return Colors.red;
  }

  Color getGLColor(String gl) {
    // N/A veya boş değerler için gri renk döndür
    if (gl == 'N/A' || gl.isEmpty) return Colors.grey;

    // Sayıya dönüştürülebiliyorsa renk ata
    final glValue = double.tryParse(gl);
    if (glValue == null) return Colors.grey;

    if (glValue <= 10) return Colors.green;
    if (glValue <= 19) return Colors.orange;
    return Colors.red;
  }

  Color getDailyGLColor(double totalGL, int target) {
    final percentage = totalGL / target;

    if (percentage <= 0.7) return Colors.green;
    if (percentage <= 0.9) return Colors.orange;
    return Colors.red;
  }

  Color getAvgGIColor(double avgGI) {
    if (avgGI <= 0) return Colors.grey; // Invalid values
    if (avgGI <= 55) return Colors.green; // Low GI
    if (avgGI <= 69) return Colors.orange; // Medium GI
    return Colors.red; // High GI
  }
}
