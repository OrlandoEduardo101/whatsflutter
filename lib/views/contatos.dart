import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/model/Conversa.dart';
import 'package:whatsflutter/model/Usuario.dart';

import '../res.dart';

class Contatos extends StatefulWidget {
  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  List<Conversa> listaConversa = [
    Conversa("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL),
    Conversa("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
    Conversa("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
    Conversa("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
    Conversa("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];

  Future<List<user>> _recuperarContatos() async {
    Firestore db = Firestore.instance;
    QuerySnapshot query = await db.collection('users').getDocuments();

    List<user> listaUser = List();

    for (DocumentSnapshot item in query.documents) {
      var dados = item.data;
      user usuario = user();
      usuario.email = dados["email"];
      usuario.nome = dados["nome"];
      usuario.urlIMG = dados["urlIMG"];
      listaUser.add(usuario);
    }

    return listaUser;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<user>>(
        future: _recuperarContatos(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    Text("Carregando contatos"),
                    CircularProgressIndicator(),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    //Conversa conversa = listaConversa[index];
                    List<user> list = snapshot.data;
                    user usuari = list[index];
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      leading: CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: usuari.urlIMG != null
                            ? NetworkImage(usuari.urlIMG)
                            : null,
                      ),
                      title: Text(
                        usuari.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      onTap:(){ Get.toNamed('/mensagens', arguments: usuari);},
                    );
                  });
              break;
          }
        });
  }
}
