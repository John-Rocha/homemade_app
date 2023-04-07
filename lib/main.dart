import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/config/env/env.dart';

import 'app/app_widget.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(AppWidget());
}
