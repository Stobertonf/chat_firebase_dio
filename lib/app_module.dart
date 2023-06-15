import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/modules/splash/splash_module.dart';
import 'package:chat_firebase_dio/app/modules/customer/costumer_module.dart';
import 'package:chat_firebase_dio/app/modules/customer/presenter/controller/customer_controller.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
      ];
}
