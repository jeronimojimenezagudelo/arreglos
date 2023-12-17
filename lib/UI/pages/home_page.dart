import 'package:arreglos/UI/pages/main_app_page.dart';
import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainAppPage(
                        mainAppController: MainAppController(),
                      )));
        },
        child: const Center(
          child: Text("ir a ordenar lista"),
        ),
      ),
    );
  }
}
