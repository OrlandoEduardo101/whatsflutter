import 'package:flutter/material.dart';
import 'package:whatsflutter/res.dart';

import 'model/Usuario.dart';

class Mensagens extends StatefulWidget {
  user contato;
  Mensagens(this.contato);
  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  TextEditingController _controllerMsg = TextEditingController();

  _enviarMsg(){

  }
  _enviarFoto(){

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
                          borderRadius: BorderRadius.circular(32),),
                      prefixIcon: IconButton(icon: Icon(Icons.camera_alt), onPressed: _enviarFoto)
                  ),
                  controller: _controllerMsg,
                ),
              ),
          ),
          FloatingActionButton(
              backgroundColor: Color(0xff075E54),
              child: Icon(Icons.send, color: Colors.white,),
              mini: true,
              onPressed: _enviarMsg
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text(widget.contato.nome),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Res.perfil2), fit: BoxFit.cover)
        ),
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text('listview'),
                  caixaMsg
                ],
              ),
            )
        ),
      ),
    );
  }
}
