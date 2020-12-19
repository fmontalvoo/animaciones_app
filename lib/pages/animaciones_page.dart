import 'dart:math' as Math;

import 'package:flutter/material.dart';

import 'package:animaciones_app/widgets/cuadrado.dart';

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidadIn;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidadIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 250.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) controller.reverse();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: Cuadrado(color: Colors.blue),
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                    opacity: opacidadIn.value - opacidadOut.value,
                    child:
                        Transform.scale(scale: agrandar.value, child: child))),
          );
        });
  }
}
