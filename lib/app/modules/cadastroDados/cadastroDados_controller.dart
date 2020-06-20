import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

part 'cadastroDados_controller.g.dart';

class CadastroDadosController = _CadastroDadosControllerBase
    with _$CadastroDadosController;

abstract class _CadastroDadosControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();
  FirebaseUser  user;

  @observable
  String msgError = '';

  @observable
  String error = '';

  @observable
  String nome = '';

  _CadastroDadosControllerBase(this.repository);

  @action
  setNome(value) => nome = value;

  @action
  Future validarCampos() async {
    if(nome.isNotEmpty && nome.length>=3){

          UserModel usuario = UserModel();
          usuario.nome = nome;
          usuario.email = auth.user.email;
          usuario.urlIMG = "";
          setUserData(usuario, auth.user.uid);

    }else{
      return (msgError = "Nome precisa ter pelo menos 3 caracteres");
    }
  }

  @action
  Future setUserData(UserModel usuario, String id) {
    print('uid2:' + auth.user.uid);
    print("Name: "+usuario.nome);

    Map<String, dynamic> dadosSet = {
      "nome" : usuario.nome,
      "email" : usuario.email,
      "urlIMG" : usuario.urlIMG
    };
    repository.setUserData(auth.user.uid, dadosSet);
    Get.offAllNamed("/home");
  }
}
