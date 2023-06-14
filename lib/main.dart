import 'package:flutter/material.dart';
import 'package:chat_firebase_dio/app_module.dart';
import 'package:chat_firebase_dio/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
