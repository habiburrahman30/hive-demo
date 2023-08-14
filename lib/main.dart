import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/controllers/config_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(ConfigController()).initAppConfig();
  runApp(App());
}
