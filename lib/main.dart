import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
