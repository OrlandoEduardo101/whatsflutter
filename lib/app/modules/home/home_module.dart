import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/home/components/contatos/contatos_controller.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/conversas_controller.dart';
import 'package:whatsflutter/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/home/home_page.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ContatosController>((i) => ContatosController(repository: i.get())),
        Bind<ConversasController>((i) => ConversasController(repository: i.get())),
      //  Bind((i) => ConversasController()),
        Bind((i) => HomeController()),
        Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
