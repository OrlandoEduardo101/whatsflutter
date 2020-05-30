import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<CadastroModule>.of();
}
