import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
class CustomerController extends ChangeNotifier {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'É Obrigatório informar seu e-mail';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.toLowerCase())) {
      return 'Por favor, digite um e-mail válido';
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, telefone deve ser preenchido';
    }
    if (value.length < 16) {
      return "Digite um número de telefone válido";
    }

    return null;
  }

  String? validateName(String? value) {
    RegExp onlyLetters = RegExp(r'^[a-zA-Z~ ]+$');
    if (value == null || value.isEmpty) {
      return 'Por favor, digite seu nome.';
    } else if (!onlyLetters.hasMatch(value)) {
      return 'Erro!!! O nome não pode conter números';
    } else if (value.length > 100) {
      return 'Erro!!! O máximo de caracteres é 100!!!';
    }
    return null;
  }
}
