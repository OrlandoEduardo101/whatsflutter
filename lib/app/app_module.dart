import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/app_controller.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';
import 'package:whatsflutter/app/shared/auth/repositories/auth_repository.dart';
import 'package:whatsflutter/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:whatsflutter/app/splash/splash_page.dart';

import 'app_widget.dart';
import 'modules/cadastro/cadastro_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    //Bind((i) => AppController()),
    Bind((i) => LoginModule()),
    Bind((i) => AuthController()),
    Bind<IAuthRepository>((i) => AuthRepository()),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => SplashPage()),
    Router('/login', module: LoginModule()),
    Router('/home', module: HomeModule()),
    Router('/cadastro', module: CadastroModule()),
  ];


  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}