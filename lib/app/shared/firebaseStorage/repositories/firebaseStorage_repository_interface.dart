import 'package:whatsflutter/app/modules/login/model/user_model.dart';

abstract class IFirebaseStorageRepository{
      Future<Map<String, dynamic>> getUserData(String id);
}