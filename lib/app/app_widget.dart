import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

//import '../Login.dart';
//import '../RouteGenerator.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Modular.navigatorKey,
      //home: Login(),
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
      //RouteGenerator.generateRoute,
      //namedRoutes: GetGenerator.rotas(),
      debugShowCheckedModeBanner: false,
    );
  }
}
