import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/model/conversas_model.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

part 'conversas_controller.g.dart';

class ConversasController = _ConversasControllerBase with _$ConversasController;

abstract class _ConversasControllerBase with Store {
  final IFirebaseStorageRepository repository;
  AuthController auth = Modular.get();

  @observable
  ObservableStream<List<ConversasModel>> listaConversa;
  @observable
  String idLog;

  _ConversasControllerBase({this.repository}){
    recuperarConversas();
  }

  @action
  Stream<List<ConversasModel>> recuperarConversas() {
    idLog = auth.user.uid;
    print("ID: "+idLog);
    listaConversa = repository.recuperarConversas(idLog).asObservable();
    print("Valor2:" + listaConversa.data.toString());
  }


}
