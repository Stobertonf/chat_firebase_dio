import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_firebase_dio/app/shared/constants/routes.dart';
import 'package:chat_firebase_dio/app/shared/components/circular_progress/circular_progress.dart';
import 'package:chat_firebase_dio/app/modules/customer/presenter/controller/customer_controller.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  FocusNode focusCPF = FocusNode();
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusTelefone = FocusNode();

  final formKey = GlobalKey<FormState>();
  final scrollCPFController = ScrollController();
  final scrollNameController = ScrollController();
  final scrollEmailController = ScrollController();
  final scrollPhoneController = ScrollController();
  late TextEditingController cpfController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    focusCPF.dispose();
    focusName.dispose();
    focusEmail.dispose();
    focusTelefone.dispose();

    cpfController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Image.asset(
                          'assets/images/smf_logo.png',
                          width: 200,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Foi identificado que você ainda não possui cadastro em nosso app..',
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AutoSizeText(
                        'Mas fique tranquilo, basta Informar seus dados para se cadastrar e conversar com seus amigos!',
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nome',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                fontSize: 21,
                                fontFamily: 'Poppins',
                              ),
                              focusNode: focusName,
                              enableSuggestions: false,
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 21,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 21,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  'E-mail',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: const TextStyle(
                                      fontSize: 21,
                                      fontFamily: 'Poppins',
                                    ),
                                    focusNode: focusEmail,
                                    enableSuggestions: false,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 5,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'CPF',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                fontSize: 21,
                                fontFamily: 'Poppins',
                              ),
                              focusNode: focusCPF,
                              enableSuggestions: false,
                              controller: cpfController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const AutoSizeText(
                            'Telefone',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                fontSize: 21,
                                fontFamily: 'Poppins',
                              ),
                              focusNode: focusTelefone,
                              enableSuggestions: false,
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                onPressed: () {
                                  /* if (formKey.currentState?.validate() == true) {
                                    Modular.to.pushReplacementNamed(
                                      Routes.chat,
                                    );
                                  }*/
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                child: const AutoSizeText(
                                  'SALVAR',
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Modular.to.pushReplacementNamed(
                                    Routes.home,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.5,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                child: const AutoSizeText(
                                  'VOLTAR',
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
