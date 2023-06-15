import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';
import 'package:chat_firebase_dio/app/modules/home/presenter/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
    _animationController!.forward().whenComplete(
      () {
        Modular.to.pushReplacementNamed(Routes.login);
      },
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/smf_logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(
                  0.2,
                ),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                child: AnimatedBuilder(
                  animation: _animation!,
                  builder: (BuildContext context, Widget? child) {
                    int percentage = (_animation!.value * 100).ceil();
                    return Stack(
                      children: [
                        Container(
                          height: 10.0,
                          width: _animation!.value * 200.0,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: Text(
                              '$percentage%',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
