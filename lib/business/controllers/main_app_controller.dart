import 'dart:math';

import 'package:flutter/material.dart';

class MainAppController {
  const MainAppController();

  Future<List<Widget>> get infoWidget => generarlistaDeWidgets(null);

  void intercambiarPosiciones(
      int indiceValorACambiar, int indice, List<int> resultado) {
    final valorAnterior = resultado[indiceValorACambiar];
    resultado[indiceValorACambiar] = resultado[indice];
    resultado[indice] = valorAnterior;
    // return resultado;
  }

  Future<List<int>> generarNumerosAleatorios(int lim) async {
    Random random = Random();
    List<int> numeros =
        List.generate(lim, (_) => random.nextInt(20001) - 10000);
    return numeros;
  }

  Future<List<Widget>> generarlistaDeWidgets(int? numeroLimite) async {
    final List<Widget> infoWidget = <Widget>[];
    final DateTime dateTime = DateTime.now();
    List<int> listaNumeros = <int>[-2, 16, 2, 5, -6, 10];
    if (numeroLimite != null) {
      listaNumeros = await generarNumerosAleatorios(numeroLimite);
    }
    ordenarLista(listaNumeros, (String msg) {
      infoWidget.add(
        Text('(${DateTime.now().difference(dateTime).inMilliseconds}) => $msg'),
      );
    });
    infoWidget.insert(
      0,
      Text(
          '(Tardó ${DateTime.now().difference(dateTime).inMilliseconds} millisegundos) en finalizar para ordenar ${listaNumeros.length}  🔥👍'),
    );
    await Future<void>.delayed(const Duration(seconds: 1));
    return infoWidget;
  }

  Future<List<int>> ordenarLista(
      List<int> listaNumerosEnteros, void Function(String) displayMsg) async {
    final List<int> resultado = <int>[...listaNumerosEnteros];

    displayMsg('$listaNumerosEnteros');

    for (int index = 0; index < listaNumerosEnteros.length; index++) {
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
      displayMsg('$resultado');
    }
    return resultado;
  }
}
