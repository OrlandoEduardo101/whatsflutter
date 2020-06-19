import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
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
    var caixaMsg = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    prefixIcon: controller.subindo ? CircularProgressIndicator() : IconButton(
                        icon: Icon(Icons.camera_alt), onPressed: controller.enviarFoto)),
                controller: controller.controllerMsg,
              ),
            ),
          ),
          Platform.isIOS ? CupertinoButton(
              child: Text("enviar"),
              onPressed: controller.enviarMsg) :
          FloatingActionButton(
              backgroundColor: Color(0xff075E54),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
              mini: true,
              onPressed: controller.enviarMsg),
        ],
      ),
    );

    var stream = Observer(
        builder: (_){
            if(controller.mensagens==null || controller.mensagens.data==null || controller.idLog == null) { print('conversas');
              return Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Text("Carregando conversas",
                          style: TextStyle(color: Colors.white),),
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
              );
            }
            if(controller.mensagens.hasError){print('erro');
                  return Expanded(
                    child: Text("erro"),
                  );
                }
              else {
                  print('AAAAAAAAAAAAAA');
                  List<MensagemModel> list = controller.mensagens.data;
                  print("queryyy: "+list.toString());
                  return Expanded(
                    child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          MensagemModel msgs = MensagemModel();
                          msgs = list[index];
                          double largura = MediaQuery.of(context).size.width * 0.8;
                          Alignment alinhamento = Alignment.centerRight;
                          Color cor = Color(0xffd2ffa5);
                          if (controller.idLog != msgs.idUser) {
                            cor = Colors.white;
                            alinhamento = Alignment.bottomLeft;
                          }
                          return Align(
                            alignment: alinhamento,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Container(
                                width: largura,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: cor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                                child: msgs.tipo == "text" ? Text(msgs.msg, style: TextStyle(fontSize: 18)) : Image.network(msgs.urlIMG),
                              ),
                            ),
                          );
                        }),
                  );
          }
        });

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
                children: [stream, caixaMsg],
              ),
            )),
      ),
    );
  }
}
