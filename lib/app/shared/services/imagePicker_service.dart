import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends Disposable {
  //dispose will be called automatically
  capturarImagemGaleria() async {
    return (File((await ImagePicker().getImage(source: ImageSource.gallery)).path));
  }
  @override
  void dispose() {}
}
