import 'package:arreglos/UI/pages/main_app_isolates_page.dart';
import 'package:arreglos/UI/pages/main_app_optimized_page.dart';
import 'package:arreglos/UI/pages/main_app_page.dart';
import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

const int cantidadIneficiente = 8800;
const int cantidadEficiente = 400000;
const int cantidadEficienteIsolate = 800000;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          _ListTile(
            page: MainAppPage(
              mainAppController: MainAppController(),
              cantidadElementosAOrdenar: cantidadIneficiente,
            ),
            title: 'ir a ordenar lista ineficiente $cantidadIneficiente Items',
          ),
          _ListTile(
            page: MainAppOptimizedPage(
              mainAppController: MainAppController(),
              cantidadElementosAOrdenar: cantidadEficiente,
            ),
            title: 'ir a ordenar lista eficiente $cantidadEficiente Items',
          ),
          _ListTile(
            page: MainAppIsolatePage(
              mainAppController: MainAppController(),
              cantidadElementosAOrdenar: cantidadEficienteIsolate,
            ),
            title:
                'ir a ordenar lista eficiente con isolate $cantidadEficienteIsolate Items',
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key,
    required this.page,
    required this.title,
  });
  final Widget page;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      title: Text(title),
      leading: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
