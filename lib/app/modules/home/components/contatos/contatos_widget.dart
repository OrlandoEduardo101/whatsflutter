import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/model/conversas_model.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'package:whatsflutter/app/shared/utils/res.dart';

import '../../home_controller.dart';
import 'contatos_controller.dart';

class ContatosWidget extends StatefulWidget {
  @override
  _ContatosWidget createState() => _ContatosWidget();
}

class _ContatosWidget extends State<ContatosWidget> {
  final controller = Modular.get<ContatosController>();

  //ContatosWidget({ key key, this.index}) : super(key: key);

 /* List<ConversasModel> listaConversa = [
    ConversasModel("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL),
    ConversasModel("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
    ConversasModel("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
    ConversasModel("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
    ConversasModel("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];*/

  @override
  Widget build(BuildContext context) {
    //print("Valor:" + controller.listaConversa.toString());
    return Observer(
        builder: (_){
        if(controller.listaConversa.hasError){
          return Center(
            child: Text('Não tem contatos'),
          );
        }else if(controller.listaConversa.data == null){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Carregando contatos"),
                Padding(padding: EdgeInsets.all(5)),
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        else {
          List<UserModel> list = controller.listaConversa.data;
          print("Valor:" + list.toString());
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                //Conversa conversa = listaConversa[index];
                // List<UserModel> list = snapshot.data;
                UserModel usuari = UserModel();
                usuari=list[index];
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
                  onTap: () {
                    Get.toNamed('/mensagens', arguments: usuari);
                  },
                );
              });
        }

      }
    );
  }
}
