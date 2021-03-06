import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsflutter/app/modules/login/model/user_model.dart';
import 'configuracoes_controller.dart';

class ConfiguracoesPage extends StatefulWidget {
  final String title;
  const ConfiguracoesPage({Key key, this.title = "Configuracoes"})
      : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState
    extends ModularState<ConfiguracoesPage, ConfiguracoesController> {
  //use 'controller' variable to access controller


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Observer(builder: (_){
       if(controller.dados.hasError){ print("errorrr");
         return Center(
           child: RaisedButton(onPressed: controller.recuperarDados, child: Text('Tente novamente'),),
         );
       }
       if(controller.dados.data == null){
         print("null");
         return Center(
           child: CircularProgressIndicator(),
         );
       }else { print("tem dados");
       UserModel usuario = controller.dados.data;
       controller.controllerNome.text = usuario.nome;
         return SingleChildScrollView(
           child: Container(
             padding: EdgeInsets.all(16),
             child: Center(
               child: Column(
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.all(16),
                     child: controller.subindo
                         ? CircularProgressIndicator()
                         : Container(),
                   ),
                   Observer(builder: (_) {
                     return CircleAvatar(
                       radius: 100,
                       backgroundImage: usuario != null ? NetworkImage(
                           usuario.urlIMG) : null,
                       backgroundColor: Colors.grey,
                     );
                   }),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       FlatButton(
                           onPressed: () {
                             controller.recuperarIMG("cam");
                           },
                           child: Text("Câmera")
                       ),
                       FlatButton(
                           onPressed: () {
                             controller.recuperarIMG("galeria");
                           },
                           child: Text("Galeria")
                       ),
                     ],
                   ),
                   Padding(
                     padding: EdgeInsets.only(bottom: 8),
                     child: Observer(builder: (_) {
                       return TextField(
                         autofocus: true,
                         keyboardType: TextInputType.text,
                         style: TextStyle(fontSize: 20),
                         decoration: InputDecoration(
                             contentPadding: EdgeInsets.fromLTRB(
                                 32, 16, 32, 16),
                             hintText: "Nome",
                             filled: true,
                             fillColor: Colors.white,
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(32))),
                         controller: controller.controllerNome,
                       );
                     }),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 16, bottom: 10),
                     child: RaisedButton(
                       child: Text(
                         "Salvar",
                         style: TextStyle(color: Colors.white, fontSize: 20),
                       ),
                       color: Colors.green,
                       padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(32)
                       ),
                       onPressed: controller.atualizarNome,
                     ),
                   ),
                 ],
               ),
             ),
           ),
         );
       } //else
      }),
    );
  }
}
