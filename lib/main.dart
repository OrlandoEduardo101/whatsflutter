import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whatsflutter/Login.dart';
import 'Home.dart';
import 'RouteGenerator.dart';
import 'dart:io';

final ThemeData tema = ThemeData(
    primaryColor: Color(0xff075E54),
    accentColor: Color(0xff25D366),
  );

final ThemeData temaIos = ThemeData(
    primaryColor: Colors.grey[200],
    accentColor: Color(0xff25D366),
  );


void main() {

  runApp(
      GetMaterialApp(
      home: Login(),
    theme: Platform.isIOS ? temaIos : tema,
    initialRoute: "/",
    onGenerateRoute:RouteGenerator.generateRoute,
    //namedRoutes: GetGenerator.rotas(),
    debugShowCheckedModeBanner: false,
  ));

 /* Firestore.instance
      .collection("users")
      .document("001")
      .setData({"nome" : "Jamilton"});*/

}
