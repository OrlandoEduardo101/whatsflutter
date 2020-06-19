import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:whatsflutter/app/modules/mensagens/mensagens_controller.dart';
import 'package:whatsflutter/app/modules/mensagens/mensagens_module.dart';

void main() {
  initModule(MensagensModule());
  // MensagensController mensagens;
  //
  setUp(() {
    //     mensagens = MensagensModule.to.get<MensagensController>();
  });

  group('MensagensController Test', () {
    //   test("First Test", () {
    //     expect(mensagens, isInstanceOf<MensagensController>());
    //   });

    //   test("Set Value", () {
    //     expect(mensagens.value, equals(0));
    //     mensagens.increment();
    //     expect(mensagens.value, equals(1));
    //   });
  });
}
