import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_page.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';

class MensagensModule extends ChildModule {
  //MensagensModule(ModularArguments args);

  @override
  List<Bind> get binds => [
        Bind((i) => MensagensController(i.get())),
        Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),

  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MensagensPage()),
      ];

  static Inject get to => Inject<MensagensModule>.of();
}
