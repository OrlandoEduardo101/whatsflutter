import 'package:flutter/material.dart';
import 'package:whatsflutter/model/Conversa.dart';
import 'package:whatsflutter/res.dart';

class Conversas extends StatefulWidget {
  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {

  List<Conversa> listaConversa = [] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Conversa cRemet = Conversa();
    listaConversa.add(Conversa("Thiago Neves", "Fala zeze, bom dia cara", Res.nevesURL));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listaConversa.length,
          itemBuilder: (context, index){

            Conversa conversa = listaConversa[index];

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
