import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/model/Conversa.dart';
import 'package:whatsflutter/model/Usuario.dart';
import 'package:whatsflutter/res.dart';

class Conversas extends StatefulWidget {
  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {

  List<Conversa> _listaConversa = List() ;
  final _controller = StreamController<QuerySnapshot>.broadcast();
  Firestore db = Firestore.instance;
  String _idLog;
  String _idDest;

  _recuperarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser userLog = await auth.currentUser();
    _idLog = userLog.uid;
   // _idDest = widget.contato.idUser;
    _ListenerConversas();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarDados();
    //Conversa cRemet = Conversa();
    _listaConversa.add(Conversa("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL));
  }

  Stream<QuerySnapshot> _ListenerConversas(){
    final stream = db.collection("conversas").document(_idLog).collection("ultima").orderBy("data").snapshots();
    stream.listen((event) {
      _controller.add(event);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _controller.stream,
        // ignore: missing_return
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    Text("Carregando conversas"),
                    CircularProgressIndicator(),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("erro");
              } else {
                QuerySnapshot query = snapshot.data;
                if(query.documents.length == 0){
                  return Center(
                    child: Text(
                      "tem conversa não",
                      style: TextStyle( fontSize: 18, fontWeight:  FontWeight.bold),
                    ),
                  );
                }else{
                  return Container(
                    child: ListView.builder(
                        itemCount: _listaConversa.length,
                        itemBuilder: (context, index){
                          //Conversa conversa = listaConversa[index];
                          List<DocumentSnapshot> convs = query.documents.toList();
                          DocumentSnapshot item = convs[index];
                          user usuario = user();
                          usuario.nome = item['nome'];
                          usuario.urlIMG = item['URLfoto'];
                          usuario.idUser = item['idDest'];
                          return ListTile(
                            onTap:(){ Get.toNamed('/mensagens', arguments: usuario);},
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            leading: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage: item["URLfoto"] != null ? NetworkImage(item["URLfoto"]) : null,
                            ),
                            title: Text(
                              item["nome"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            subtitle: Text(
                              item['tipo'] == 'text' ?
                              item["mensagem"] : "Imagem...",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                            ),
                          );
                        }
                    ),
                  );
                }
              }
              break;
          }
        }
    );
  }
}
