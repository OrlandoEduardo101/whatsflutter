import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final auth = Modular.get<AuthController>();

  _HomeControllerBase(){
    if(auth.status == AuthStatus.logoff){
      Get.offAllNamed("/login");
    }
  }

  @action
  escolhaMenuItem(String itemEscolhido){
    switch(itemEscolhido){
      case "Configurações":
        Get.toNamed('/conf');
        print("Configs");
        break;
      case "Deslogar":
        logoff();
        print("Deslogar");
        break;
    }
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  logoff() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
