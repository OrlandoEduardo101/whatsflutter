import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/app_controller.dart';
import 'package:whatsflutter/app/modules/cadastroDados/cadastroDados_module.dart';
import 'package:whatsflutter/app/modules/configuracoes/configuracoes_controller.dart';
import 'package:whatsflutter/app/modules/configuracoes/configuracoes_module.dart';
import 'package:whatsflutter/app/modules/login/login_controller.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_module.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_page.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/auth/repositories/auth_repository.dart';
import 'package:whatsflutter/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository.dart';
import 'package:whatsflutter/app/shared/firebaseStorage/repositories/firebaseStorage_repository_interface.dart';
import 'package:whatsflutter/app/splash/splash_page.dart';

import 'app_widget.dart';
import 'modules/cadastro/cadastro_controller.dart';
import 'modules/cadastro/cadastro_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/mensagens/mensagens_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    //Bind((i) => AppController()),
    Bind((i) => LoginModule()),
    Bind((i) => AuthController()),
    Bind((i) => LoginController(i.get())),
    Bind((i) => CadastroController(i.get())),
    Bind((i) => ConfiguracoesController(i.get())),
    //Bind((i) => CadastroController(i.get())),
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => MensagensController()),
    Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => SplashPage()),
    Router('/login', module: LoginModule()),
    Router('/home', module: HomeModule()),
    Router('/cadastro', module: CadastroModule()),
    Router('/cadastroDados', module: CadastroDadosModule()),
    Router('/conf', module: ConfiguracoesModule()),
    //Router('/mensagens', module: MensagensModule()),
    Router('/mensagens', child: (_, args) => MensagensPage(model: args.data)),
  ];


  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}