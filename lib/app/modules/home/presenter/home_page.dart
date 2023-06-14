import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Criar conta',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Ir para o chat/conversas',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
