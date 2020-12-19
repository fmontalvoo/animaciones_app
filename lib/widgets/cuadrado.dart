import 'package:flutter/material.dart';

class Cuadrado extends StatelessWidget {
  final Color color;

  Cuadrado({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(color: this.color),
    );
  }
}
