import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsflutter/app/shared/utils/constants.dart';
part 'textError_controller.g.dart';

class TextErrorController = _TextErrorControllerBase with _$TextErrorController;

abstract class _TextErrorControllerBase with Store {
  @observable
  Color color = verdeRecode;

  @action
  Color setColor(value) => (color = value);

}
