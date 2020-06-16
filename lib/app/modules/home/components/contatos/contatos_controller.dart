import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/model/conversas_model.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

import '../../../../../res.dart';

part 'contatos_controller.g.dart';

class ContatosController = _ContatosControllerBase with _$ContatosController;

abstract class _ContatosControllerBase with Store {
  final IFirebaseStorageRepository repository;
  //final FirebaseStorageRepository repository;

  /*@observable
  List<ConversasModel> listaConversa = [
  ConversasModel("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL),
  ConversasModel("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
  ConversasModel("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
  ConversasModel("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
  ConversasModel("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];*/

  @observable
  ObservableStream<List<UserModel>> listaConversa;

  _ContatosControllerBase({this.repository}){
   recuperarContatos();
  }

  @action
  Stream<List<UserModel>> recuperarContatos() {
    listaConversa = repository.recuperarContatos().asObservable();
    print("Valor2:" + listaConversa.data.toString());
  }

  }
