import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {

  AuthController auth = Modular.get();

  @observable
  String msgError = '';

  @observable
  String error = '';

  @observable
  String nome = '';

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
          usuario.name = nome;
          usuario.email = email;
          usuario.password = senha;
          cadastrarUser(usuario);
          /*setState(() {
            _msgError = "Sucesso";
          });*/
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
  cadastrarUser(UserModel usuario){

    auth.getCreateUser(usuario.email, usuario.password).then((firebaseUser){

    /*Firestore db = Firestore.instance;
    db.collection("users")
        .document(firebaseUser.user.uid)
        .setData(usuario.toMap());*/

    Get.offAllNamed("/home");

    msgError = "Sucesso";

    }).catchError((error){
    print("Erro:" + error.toString());
    msgError = "Erro, verifique os campos!";
    });
    //Get.offAllNamed("/home");
  }
}
