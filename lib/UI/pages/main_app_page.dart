import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<int> ejercicioUno = <int>[-2, 16, 2, 5, -6, 10];
    List<int> resultado = <int>[...ejercicioUno];
    int valorAnterior = 0;
    int indice = 0;
    for (int iteracion = 0; iteracion < resultado.length; iteracion++) {
      if (valorAnterior > resultado[iteracion]) {
        indice = iteracion;
      }
    }
    valorAnterior = resultado[0];
    resultado[0] = resultado[indice];
    resultado[indice] = valorAnterior;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('$ejercicioUno'),
              Text('$resultado'),
            ],
          ),
        ),
      ),
    );
  }
}
