import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';
import 'package:chat_firebase_dio/app/modules/home/presenter/home_page.dart';
import 'package:chat_firebase_dio/app/modules/customer/presenter/customer_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          Routes.customer,
          child: (_, args) => const CustomerPage(),
        ),
      ];
}
