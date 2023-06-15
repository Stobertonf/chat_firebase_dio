import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  /*final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();*/
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

/*  Future<UserCredential?> _signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Autenticação com email e senha realizada com sucesso
      print('Usuário logado: ${userCredential.user}');
    } catch (e) {
      print('Erro de autenticação: ${e.toString()}');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/firebase_logo_icon.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text(
                'Login',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedButton.icon(
              onPressed: () async {},
              /*{
                final UserCredential? userCredential =
                    await _signInWithGoogle();

                if (userCredential != null) {
                  print('Usuário logado com Google: ${userCredential.user}');
                } else {
                  print('Falha no login com Google');
                }
              },*/
              icon: const Icon(
                Icons.person,
              ),
              label: const Text(
                'Login com Google',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
