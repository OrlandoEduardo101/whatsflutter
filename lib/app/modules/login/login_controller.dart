import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/stores/exception_store.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';
import 'package:whatsflutter/app/shared/utils/constants.dart';

import 'components/textError/textError_controller.dart';
import 'model/user_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  AuthController auth = Modular.get();
  final IFirebaseStorageRepository repository;
  UserModel user = UserModel();

  ExceptionStore exceptionStore = ExceptionStore();
  TextErrorController textErrorController = TextErrorController();

  @observable
  var data;

  @observable
  bool load = false;

  @observable
  String email = '';

  _LoginControllerBase(IFirebaseStorageRepository this.repository);

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
      FirebaseUser user = await auth.loginWithEmail(email, password).then((_) async {
      load = true;
      await verifyUserData(auth.user.uid);
    } ).catchError((e){
      load = false;
      textErrorController.setColor(Colors.red);
      print("Erro:"+e.toString());
      exceptionStore.getError(e.toString());
    });
  }

 @action
  Future loginWithGoogle() async {
    try{
      load = true;
      print("login");
      await auth.loginWithGoogle();
      Get.offAllNamed('/home');
    }catch(e){
      load = false;
    }
  }


  @action
   Future verifyUserData(String uid) async {
        data =  await repository.verifyUserData(uid);
        if(data == null){
          print("uid:  "+uid);
          Get.offAllNamed('/cadastroDados');
        } else{
          print("data: "+data.toString());
          Get.offAllNamed('/home');
        }

  }

  toCadastro(){
    Get.toNamed('/cadastro');
  }


}
