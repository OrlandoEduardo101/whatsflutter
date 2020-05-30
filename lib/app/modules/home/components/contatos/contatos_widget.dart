import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/home/components/conversas/model/conversas_model.dart';
import 'package:whatsflutter/app/shared/utils/res.dart';

import '../../home_controller.dart';

class ContatosWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  //ContatosWidget({ key key, this.index}) : super(key: key);

  List<ConversasModel> listaConversa = [
    ConversasModel("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL),
    ConversasModel("Richarlison Pombo", "PRUUUUU", Res.pomboURL),
    ConversasModel("Fabuloso", "Prefiro ajudar na briga!", Res.fabulosoURL),
    ConversasModel("Marinho", "que merda hein?! sabia não", Res.marinhoURL),
    ConversasModel("Mr. Jesus", "Ôto patamá", Res.jesusURL),
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
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
          );

        }
    );
  }
}
