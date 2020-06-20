import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

part 'contatos_controller.g.dart';

class ContatosController = _ContatosControllerBase with _$ContatosController;

abstract class _ContatosControllerBase with Store {
  final IFirebaseStorageRepository repository;

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
