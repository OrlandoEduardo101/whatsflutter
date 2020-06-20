import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/modules/mensagens/componets/caixaMsg/caixaMsg_widget.dart';
import 'package:whatsflutter/app/modules/mensagens/componets/mensagensList/mensagensList_widget.dart';
import 'package:whatsflutter/app/modules/mensagens/model/mensagem_model.dart';
import '../../../res.dart';
import 'mensagens_controller.dart';

class MensagensPage extends StatefulWidget {
  final String title;
  final UserModel model;
  const MensagensPage({Key key, this.title = "Mensagens",  this.model}) : super(key: key);

  @override
  _MensagensPageState createState() => _MensagensPageState();
}

class _MensagensPageState
    extends ModularState<MensagensPage, MensagensController> {
  //use 'controller' variable to access controller
  UserModel model2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.setContato(widget.model);
    controller.setIdDest(widget.model.uid);

  }

  @override
  Widget build(BuildContext context) {
    //var listview =
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: widget.model.urlIMG != null
                  ? NetworkImage(widget.model.urlIMG)
                  : null,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.model.nome),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Res.perfil2), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [MensagensListWidget(), CaixaMsgWidget()],
              ),
            )),
      ),
    );
  }
}
