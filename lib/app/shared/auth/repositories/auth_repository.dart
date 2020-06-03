import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository implements IAuthRepository{

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getEmailPasswordLogin(String email, String password) async{
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email:email, password:password)).user;
    return user;
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getUser() {
    return (FirebaseAuth.instance.currentUser());
  }

  @override
  Future getLogout() async {
    return await _auth.signOut();
  }

  @override
  Future<FirebaseUser> getCreateUser(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    )).user;
    return user;

    /*then((user){
      print("Sucess cadastro");
      return user;
    }).catchError((error){
      print("erro cadastro" + error.toString());
      return error;
    });*/
  }

}

