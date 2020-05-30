import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/stores/exception_store.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/utils/constants.dart';

import 'components/textError/textError_controller.dart';
import 'model/user_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  AuthController auth = Modular.get();
  Future<FirebaseUser> userCurrent;

  UserModel userLogged = UserModel();

  ExceptionStore exceptionStore = ExceptionStore();
  TextErrorController textErrorController = TextErrorController();

  @observable
  bool load = false;

  @observable
  String email = '';

  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  setPassword(String value) => password = value;

  @action
  Future loginWithEmail() async {
      textErrorController.setColor(verdeRecode);
      exceptionStore.setError('Carregando...');
      FirebaseUser user = await auth.loginWithEmail(email, password).then((_){
      load = true;
      Modular.to.pushReplacementNamed('/home');
    } ).catchError((e){
      load = false;
      textErrorController.setColor(Colors.red);
      print("Erro:"+e.toString());
      exceptionStore.getError(e.toString());
    });

    /*try{
      load = true;
      await auth.loginWithEmail(email, password);
      Modular.to.pushReplacementNamed('/home');
    }catch(e){
      load = false;
      print("Erro:"+e.toString());
    }*/
  }

 @action
  Future loginWithGoogle() async {
    try{
      load = true;
      print("login");
      await auth.loginWithGoogle();
      //Modular.to.pushReplacementNamed('/home');
      Get.offAllNamed('/home');
    }catch(e){
      load = false;
    }
  }


  getUserData(){

  }

  toCadastro(){
    Get.toNamed('/cadastro');
  }


}
