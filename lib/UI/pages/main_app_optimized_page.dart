import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

class MainAppOptimizedPage extends StatelessWidget {
  const MainAppOptimizedPage({
    super.key,
    this.cantidadElementosAOrdenar = 8800,
    required this.mainAppController,
  });

  final MainAppController mainAppController;
  final int cantidadElementosAOrdenar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordenando con la funcion eficiente'),
      ),
      body: Center(
        child: FutureBuilder<List<Widget>>(
          future: mainAppController.generarlistaDeWidgets(
              cantidadElementosAOrdenar, true),
          builder: (_, AsyncSnapshot<List<Widget>> snapshot) {
            final List<Widget>? children = snapshot.data;

            if (children != null) {
              if (children.isNotEmpty) {
                return ListView.builder(
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    return children[index];
                  },
                );
              }
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
