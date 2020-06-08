import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsflutter/model/Mensagem.dart';
import 'package:whatsflutter/res.dart';

import 'model/Usuario.dart';

class Mensagens extends StatefulWidget {
  user contato;
  Mensagens(this.contato);
  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  String _idLog;
  String _idDest;

  List<String> listaMsg = [
    "Fala Zeze",
    "Bomdia cara",
    "deixa eu te falar",
    "adianta os 60%"
  ];
  
  TextEditingController _controllerMsg = TextEditingController();

  _enviarMsg(){

    String msg = _controllerMsg.text;
    if (msg.isNotEmpty) {
      
      Mensagem msgm = Mensagem();
      msgm.idUser = _idLog;
      msgm.msg = msg;
      msgm.urlIMG = "";
      msgm.tipo = "text";
      _salvarMsg(_idLog, _idDest, msgm);
    } else {
    }

  }
  _enviarFoto(){

  }

  _salvarMsg(String idRemet, String idDest, Mensagem msg){
    Firestore db = Firestore.instance;
    db.collection("menssagens").document(idRemet).collection(idDest).add(msg.toMap());
    _controllerMsg.clear();
  }

  _recuperarDados()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser userLog = await auth.currentUser();
    _idLog = userLog.uid;
    _idDest = widget.contato.idUser;
    
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarDados();
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
    var listview = Expanded(
        child: ListView.builder(
            itemCount: listaMsg.length,
            itemBuilder: (context, index){
              double largura = MediaQuery.of(context).size.width*0.8;
              Alignment alinhamento = Alignment.centerRight;
              Color cor = Color(0xffd2ffa5);
              if(index%2 == 0){
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
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Text(listaMsg[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }
        ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: widget.contato.urlIMG != null ? NetworkImage(widget.contato.urlIMG) : null,
            ),
            Padding(padding: EdgeInsets.only(left:8), child: Text(widget.contato.nome),),
          ],
        ),
        ),
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
                  listview,
                  caixaMsg
                ],
              ),
            )
        ),
      ),
    );
  }
}
