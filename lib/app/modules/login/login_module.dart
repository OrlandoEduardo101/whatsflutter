
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/login/stores/exception_store.dart';
import 'components/textError/textError_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TextErrorController()),
        Bind((i) => LoginController(i.get())),
        Bind((i) => ExceptionStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => LoginPage(),
            transition: TransitionType.noTransition),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
