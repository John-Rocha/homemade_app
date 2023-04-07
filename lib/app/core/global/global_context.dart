import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContext {
  //! Nunca deixar o navigatorKey público!!!
  late final GlobalKey<NavigatorState> _navigatorKey;

  static GlobalContext? _instance;

  GlobalContext._();
  static GlobalContext get i {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> loginExpire() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    showTopSnackBar(
      _navigatorKey.currentState!.overlay!,
      const CustomSnackBar.error(
        message: 'Login expirado, clique na sacola novamente',
        backgroundColor: Colors.black,
      ),
    );
    _navigatorKey.currentState!.popUntil(
      ModalRoute.withName('/home'),
    );
  }
}
