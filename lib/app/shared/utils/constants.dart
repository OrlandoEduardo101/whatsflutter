import 'package:flutter/material.dart';

const String URL_BASE = "https://pokeapi.co/api/v2/";
//const Color verdeRecode = Color.fromRGBO(18, 170, 153, 1);
const MaterialColor verdeRecode = const MaterialColor(0xff12aa99,
  const <int, Color>{
    50:  const Color(0xFF09554c),
    100: const Color(0xFF0a665b),
    200: const Color(0xFF0c766b),
    300: const Color(0xFF0e887a),
    400: const Color(0xFF109989),
    500: const Color(0xff12aa99),
    600: const Color(0xff41bbad),
    700: const Color(0xff59c3b7),
    800: const Color(0xffa0ddd6),
    900: const Color(0xFFb7e5e0),
  },
);
//const Color verdeRecode = Colors.;

const List<String> ERROR_LOGIN = [
  'PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)',
  'PlatformException(ERROR_USER_NOT_FOUND, There is no user record corresponding to this identifier. The user may have been deleted., null)',
  'PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)',
  'PlatformException(ERROR_NETWORK_REQUEST_FAILED, A network error (such as timeout, interrupted connection or unreachable host) has occurred., null)'
];