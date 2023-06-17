import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_firebase_dio/app_module.dart';
import 'package:chat_firebase_dio/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseAndRunApp();
}

Future<void> initializeFirebaseAndRunApp() async {
  await Firebase.initializeApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
