import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/modules/home/home_page.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.home,
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          Routes.start,
          child: (_, args) => const HomePage(),
        ),
      ];
}
