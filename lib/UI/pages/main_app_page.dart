import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.mainAppController,
  });

  final MainAppController mainAppController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Widget>>(
            future: mainAppController.generarlistaDeWidgets(1200),
            builder: (_, AsyncSnapshot<List<Widget>> snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
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
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
