import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/Cadastro.dart';
import 'package:whatsflutter/Home.dart';
import 'package:whatsflutter/Login.dart';
import 'package:whatsflutter/configuracoes.dart';
import 'package:whatsflutter/mensagens.dart';

class RouteGenerator {
    static Route<dynamic> generateRoute (RouteSettings settings){

      final args = settings.arguments;

      switch(settings.name){
        case "/":
          return MaterialPageRoute(
              builder: (context) => Login()
          );
        case "/login":
          return MaterialPageRoute(
              builder: (context) => Login()
          );
        case "/cadastro":
          return MaterialPageRoute(
              builder: (context) => Cadastro()
          );
        case "/home":
          return MaterialPageRoute(
              builder: (context) => Home()
          );
        case "/conf":
          return MaterialPageRoute(
              builder: (context) => Configs()
          );
          case "/mensagens":
          return MaterialPageRoute(
              builder: (context) => Mensagens(args)
          );
        default:
          _erroRota();
      }
    }
    static Route<dynamic> _erroRota(){
      return MaterialPageRoute(
          builder: (_){
            return Scaffold(
              appBar: AppBar(
                title: Text("Tela não encontrada!"),
              ),
              body: Center(
                child:  Text("Tela não encontrada!"),
              ),
            );
          }
      );
    }
}

/*class GetGenerator {
  static Map<String, dynamic> rotas(){
    Map<String, dynamic> rota = {
      '/' : GetRoute(page: Login()),
      '/login' : GetRoute(page: Login()),
      '/home' : GetRoute(page: Home()),
      //'/home' : GetRoute(page: Home()),
    };
    return rota;
  }
}*/