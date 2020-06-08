import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/Login.dart';
import 'package:whatsflutter/views/contatos.dart';
import 'package:whatsflutter/views/conversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;
  List<String> itensMenu = ["Configurações","Deslogar"];

  Future _verificar() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser userLog = await auth.currentUser();
    if (userLog == null) {
      Get.offAllNamed("/login");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificar();
    _tabController = TabController(length: 2, vsync: this);
  }

  _escolhaMenuItem(String itemEscolhido){
    switch(itemEscolhido){
      case "Configurações":
        Get.toNamed('/conf');
        print("Configs");
        break;
      case "Deslogar":
        _deslogar();
        print("Deslogar");
        break;
    }
    //print("Item: $itemEscolhido");
  }

  _deslogar()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Get.offAllNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "Conversas",),
            Tab(text: "Contatos",),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected:_escolhaMenuItem ,
            itemBuilder: (context){
              return itensMenu.map((String item){
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Conversas(),
          Contatos(),
        ],
      ),
    );
  }
}
