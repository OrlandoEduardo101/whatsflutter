
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/login/stores/exception_store.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';
import 'components/textError/textError_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TextErrorController()),
        Bind((i) => LoginController(i.get())),
        Bind((i) => ExceptionStore()),
        Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => LoginPage(),
            transition: TransitionType.noTransition),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
