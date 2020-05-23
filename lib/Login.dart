import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:whatsflutter/Cadastro.dart';
import 'package:whatsflutter/Home.dart';
import 'package:whatsflutter/res.dart';
import 'package:get/get.dart';

import 'model/Usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _msgError = "";

  Future _verificar() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser userLog = await auth.currentUser();
    if (userLog != null) {
      Get.to(Home());
    }
  }

  @override
  void initState() {
    _verificar();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    Res.logo,
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                    controller: _controllerEmail,
                  ),
                ),
                TextField(
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                  controller: _controllerSenha,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                      ),
                      onPressed: () {
                        _validarCampos();
                      }),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                        "Não tem conta? cadastre-se!",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Get.to(Cadastro());
                      print("cadastre-se");
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        _msgError,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20
                        ),
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validarCampos(){


    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

      if (email.isNotEmpty && email.contains("@")) {

        if (senha.isNotEmpty) {
          user usuario = user();
          usuario.email = email;
          usuario.senha = senha;
          _logarUser(usuario);
          /*setState(() {
            _msgError = "Sucesso";
          });*/
        }  else {
          setState(() {
            _msgError = "Senha precisa ter pelo menos 6 caracteres";
          });
        }
      }  else{
        setState(() {
          _msgError = "Insira um email válido";
        });
      }


  }

  _logarUser(user usuario){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser){

      Get.to(Home());

    } )
    .catchError((error){
      setState(() {
        _msgError = "erro, usuario ou senha invalidos!";
      });
      print(error.toString());
    });
  }

}
