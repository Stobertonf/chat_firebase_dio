import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/smf_logo.png',
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Bem-vindo',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  Modular.to.pushReplacementNamed(
                    Routes.customer,
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5,
                      color: Colors.red,
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: AutoSizeText(
                  'Criar conta',
                  style: TextStyle(
                    height: 1,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    color: Colors.red[400],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red[400],
                ),
                child: const AutoSizeText(
                  'Chat',
                  style: TextStyle(
                    height: 1,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
