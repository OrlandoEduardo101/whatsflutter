import 'package:flutter/material.dart';
import 'package:whatsflutter/app/shared/utils/res.dart';

import 'model/conversas_model.dart';

class ConversasWidget extends StatelessWidget {

  List<ConversasModel> listaConversa = [
    ConversasModel(nome: "Thiago Neves", mensagem: "Fala zeze, bom dia cara", URLfoto: Res.nevesURL),
    //ConversasModel("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
    //ConversasModel("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
    //ConversasModel("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
    //ConversasModel("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listaConversa.length,
          itemBuilder: (context, index){

            ConversasModel conversa = listaConversa[index];

            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(conversa.URLfoto),
              ),
              title: Text(
                conversa.nome,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
              subtitle: Text(
                conversa.mensagem,
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
