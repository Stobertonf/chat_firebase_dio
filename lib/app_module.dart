import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
