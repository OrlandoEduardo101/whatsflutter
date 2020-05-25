import 'package:flutter/material.dart';
import 'package:whatsflutter/res.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Configs extends StatefulWidget {
  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {

  TextEditingController _controllerNome = TextEditingController();
  File _img;

  Future _recuperarIMG(String origem)async{
      File imagemSelecionada;
      switch(origem) {
        case "cam":
          imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
          break;
        case "galeria":
          imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
          break;
        default:
      }
      setState(() {
        _img = imagemSelecionada;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Carregando
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(Res.jesusURL),
                  backgroundColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){_recuperarIMG("cam");},
                        child: Text("Câmera")
                    ),
                    FlatButton(
                        onPressed: (){_recuperarIMG("galeria");},
                        child: Text("Galeria")
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                    controller: _controllerNome,
                  ),
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
                      onPressed: () {

                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
