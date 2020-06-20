import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/mensagens/model/mensagem_model.dart';

import '../../mensagens_controller.dart';

class MensagensListWidget extends StatelessWidget {
  MensagensController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(
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
  }
}
