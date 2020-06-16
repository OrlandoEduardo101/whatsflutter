import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/cadastroDados/cadastroDados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/cadastroDados/cadastroDados_page.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class CadastroDadosModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CadastroDadosController(i.get())),
    Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CadastroDadosPage()),
      ];

  static Inject get to => Inject<CadastroDadosModule>.of();
}
