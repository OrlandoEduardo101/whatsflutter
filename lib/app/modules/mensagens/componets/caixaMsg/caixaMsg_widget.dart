import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_controller.dart';

class CaixaMsgWidget extends StatelessWidget {
  MensagensController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
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
    });
  }
}
