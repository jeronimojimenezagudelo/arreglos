import 'dart:math';

import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void intercambiarPosiciones(
      int indiceValorACambiar, int indice, List<int> resultado) {
    final valorAnterior = resultado[indiceValorACambiar];
    resultado[indiceValorACambiar] = resultado[indice];
    resultado[indice] = valorAnterior;
    // return resultado;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    const List<int> ejercicioUno = <int>[-2, 16, 2, 5, -6, 10];
    //final List<int> ejercicioUno = generarNumerosAleatorios(100);
    //final List<int> ejercicioUno = generarNumerosAleatorios(100);

    final List<int> resultado = <int>[...ejercicioUno];
    final List<Widget> infoWidget = <Widget>[];

    void displayMsg(dynamic msg) {
      infoWidget.add(
        Text('(${DateTime.now().difference(dateTime).inMilliseconds}) => $msg'),
      );
    }

    displayMsg('$dateTime => $ejercicioUno');

    for (int index = 0; index < ejercicioUno.length; index++) {
      int indice = index;

      for (int iteracion = index + 1;
          iteracion < resultado.length;
          iteracion++) {
        if (resultado[indice] > resultado[iteracion]) {
          displayMsg('INTERCAMBIA');
          indice = iteracion;
        }
      }
      intercambiarPosiciones(index, indice, resultado);
      displayMsg(resultado);
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: infoWidget.length,
            itemBuilder: (context, index) {
              return infoWidget[index];
            },
          ),
        ),
      ),
    );
  }
}

List<int> generarNumerosAleatorios(int lim) {
  Random random = Random();
  List<int> numeros = List.generate(lim, (_) => random.nextInt(20001) - 10000);
  return numeros;
}
