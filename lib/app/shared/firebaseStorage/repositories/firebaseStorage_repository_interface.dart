import 'package:whatsflutter/app/modules/login/model/user_model.dart';

abstract class IFirebaseStorageRepository{
      Stream<UserModel> getUserData(String id);
}