import 'package:flutter/material.dart';

// import 'package:animaciones_app/pages/animaciones_page.dart';
import 'package:animaciones_app/pages/cuadrado_animado_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones App',
      home: CuadradoAnimadoPage(),
    );
  }
}
