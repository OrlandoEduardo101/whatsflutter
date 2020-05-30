import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/modules/login/components/textError/textError_controller.dart';
import 'package:whatsflutter/app/modules/login/stores/exception_store.dart';
import '../../login_controller.dart';

class TextErrorWidget extends StatelessWidget {
  final TextErrorController controller = Modular.get();
  final LoginController loginController = Modular.get();
  final ExceptionStore exceptionStore = Modular.get();



  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Observer(
          builder: (_){
            return  Text(
              loginController.exceptionStore.textError,
              style: TextStyle(
                  color:  loginController.textErrorController.color,
                  fontStyle: FontStyle.italic
              ),
            );
          }
      ),
    );



  }
}
