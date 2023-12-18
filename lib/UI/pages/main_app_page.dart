import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({
    super.key,
    required this.mainAppController,
  });

  final MainAppController mainAppController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Widget>>(
          future: mainAppController.generarlistaDeWidgets(8800),
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
