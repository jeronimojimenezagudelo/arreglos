import 'package:arreglos/UI/pages/main_app_page.dart';
import 'package:arreglos/business/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp(
    mainAppController: MainAppController(),
  ));
}
