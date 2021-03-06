import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();
  FirebaseUser  user;

  @observable
  String msgError = '';

  @observable
  String error = '';

  @observable
  String nome = '';

  _CadastroControllerBase(this.repository);

  @action
  setNome(value) => nome = value;

  @observable
  String email = '';

  @action
  setEmail(value) => email = value;

 @observable
  String senha = '';

  @action
  setSenha(value) => senha = value;


  @action
  Future validarCampos() async {
    if(nome.isNotEmpty && nome.length>=3){

      if (email.isNotEmpty && email.contains("@")) {

        if (senha.isNotEmpty && senha.length>5) {
          UserModel usuario = UserModel();
          usuario.nome = nome;
          usuario.email = email;
          usuario.password = senha;
          usuario.urlIMG = "";
          cadastrarUser(usuario);

        }  else {
            return msgError = "Senha precisa ter pelo menos 6 caracteres";
        }
      }  else{
          return msgError = "Insira um email válido";
      }

    }else{
        return (msgError = "Nome precisa ter pelo menos 3 caracteres");
    }
  }

  @action
  Future cadastrarUser(UserModel usuario) async {

    user = await auth.getCreateUser(usuario.email, usuario.password).then((firebaseUser) {
    print('uid:' + auth.user.uid);
    setUserData(usuario, auth.user.uid);

      msgError = "carregando...";

    }).catchError((error){
    print("Erro:" + error.toString());
    msgError = "Erro, verifique os campos!";
    });

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
