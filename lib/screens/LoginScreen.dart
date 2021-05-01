import 'package:flutter/material.dart';
import 'MyWidgets.dart';
import 'RegisterScreen.dart';
import 'MainScreen.dart';

import 'package:e_vacina/globals.dart';

class LoginMenu extends StatefulWidget {
  @override
  _LoginMenuState createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  final Color gangGray = Color.fromRGBO(51, 51, 51, 1.0);
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  var _email;
  var _password;

  String _wrongEmail = null;
  String _wrongPassword = null;

  void mudaTela(bool resposta) {
    if (resposta == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      setState(() {
        _wrongEmail = "";
        _wrongPassword = "Email e/ou senha inválidos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'e-Vacina',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyWidgets().caixaTexto('Email', emailCon, errorText: _wrongEmail),
            MyWidgets().caixaTexto('Senha', passwordCon,isObscure: true, errorText: _wrongPassword),
            MyWidgets().textButton('Esqueci a senha', 200, 40, 20, gangGray,
                () {
              api.testConnection();
            }),
            MyWidgets().button(
                'Entrar', 320.0, 50.0, 26, Theme.of(context).primaryColor, () {
              setState(() {
                _email = emailCon.text;
                _password = passwordCon.text;
              });

              userController
                  .login(_email, _password)
                  .then((resposta) => mudaTela(resposta));
            }),
            Text('OU\n'),
            MyWidgets().button('Registre-se', 200.0, 50.0, 16, gangGray, () {
              print('Registrar');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
