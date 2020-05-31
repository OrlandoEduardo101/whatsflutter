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
  Future<FirebaseUser> userCurrent;
  //final IFirebaseStorageRepository repository;
  FirebaseStorageRepository repository = FirebaseStorageRepository(Firestore.instance);
  UserModel user = UserModel();
  //var userData;

  UserModel userLogged = UserModel();

  ExceptionStore exceptionStore = ExceptionStore();
  TextErrorController textErrorController = TextErrorController();

  @observable
  var data;

  @observable
  bool load = false;

  @observable
  bool hasData = false;

  @observable
  String email = '';

  _LoginControllerBase({this.repository});

  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  setPassword(String value) => password = value;

  /*@observable
  String idLog = '';

  @action
  getIdLog(){
    idLog = auth.user.uid;
    return idLog;
  }*/

  @action
  Future loginWithEmail() async {
      textErrorController.setColor(verdeRecode);
      exceptionStore.setError('Carregando...');
      FirebaseUser user = await auth.loginWithEmail(email, password).then((_) {
      load = true;

      verifyUserData(auth.user.uid);

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


  @action
   Future verifyUserData(String uid) async {

        try{
          await repository.getUserData(user.uid);
          Get.offAllNamed('/home');
        }catch(e){
          toCadastro();
          print("Catch:" + e.toString());
        }

    /*print(uid);
        data = await repository.getUserData(user.uid);
        print("id:" +uid);
        
        var nome = data['nome'];
        print("id:" +uid);
        print(nome);
        if(nome == ''){
          hasData = false;
          print("data: "+data.toString());
          toCadastro();
        } else{
          hasData = true;
          print("data: "+data.toString());
          Get.offAllNamed('/home');
        }
        print(nome);
        //userData = user.fromSnapshot(dados);
        print("dadoss: " + data);
        print("data:${data}");
        print("userData:"+data.toString());

       if(!hasData){
          print("data: "+data.toString());
          toCadastro();
        }else{
          print("data: "+data.toString());
          Get.offAllNamed('/home');
        }*/

  }

  toCadastro(){
    Get.toNamed('/cadastro');
  }


}
