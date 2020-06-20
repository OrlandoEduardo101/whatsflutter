import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/home/components/contatos/contatos_controller.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/conversas_controller.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/utils/res.dart';

import 'model/conversas_model.dart';

class ConversasWidget extends StatelessWidget {
  ConversasController controller = Modular.get();
  /*List<ConversasModel> listaConversa = [
    ConversasModel(nome: "Thiago Neves", mensagem: "Fala zeze, bom dia cara", URLfoto: Res.nevesURL),
    //ConversasModel("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
    //ConversasModel("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
    //ConversasModel("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
    //ConversasModel("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          if(controller.listaConversa.hasError){
            return Center(
              child: Text('Não tem conversas'),
            );
          }else if(controller.listaConversa.data == null){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Carregando conversas"),
                  Padding(padding: EdgeInsets.all(5)),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          else {
            List<ConversasModel> list = controller.listaConversa.data;
            print("Valor:" + list.toString());
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  //Conversa conversa = listaConversa[index];
                  // List<UserModel> list = snapshot.data;
                  ConversasModel conv = ConversasModel();
                  conv=list[index];
                  UserModel user = UserModel(nome: conv.nome, urlIMG: conv.URLfoto, uid: conv.idDest);
                  return ListTile(
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: conv.URLfoto != null
                          ? NetworkImage(conv.URLfoto)
                          : null,
                    ),
                    title: Text(
                      conv.nome,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      conv.tipo != 'text' ?
                       "Imagem..." : conv.mensagem,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14
                      ),
                    ),
                    onTap: () {
                      Modular.to.pushNamed('/mensagens', arguments: user);
                    },
                  );
                });
          }

        }
    );
  }
}
