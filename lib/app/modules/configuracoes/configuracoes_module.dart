import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/configuracoes/configuracoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/configuracoes/configuracoes_page.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class ConfiguracoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfiguracoesController(i.get())),
        Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ConfiguracoesPage()),
      ];

  static Inject get to => Inject<ConfiguracoesModule>.of();
}
