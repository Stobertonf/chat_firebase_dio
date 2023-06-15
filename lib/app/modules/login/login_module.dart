import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';
import 'package:chat_firebase_dio/app/modules/login/presenter/login_page.dart';

class LoginModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => LoginPage(),
        ),
        ChildRoute(
          Routes.login,
          child: (_, args) => LoginPage(),
        ),
      ];
}
