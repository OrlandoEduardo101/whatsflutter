import 'package:whatsflutter/app/modules/configuracoes/configuracoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/configuracoes/configuracoes_page.dart';

class ConfiguracoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfiguracoesController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ConfiguracoesPage()),
      ];

  static Inject get to => Inject<ConfiguracoesModule>.of();
}
