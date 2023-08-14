import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/hive_service.dart';

class ConfigController extends GetxController {
  Future<void> initAppConfig() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Hive DB
    await Get.put(HiveService()).onInitForApp();
    // ---------------------------------------------------
  }

// Initialize page after default configuration
  void init() async {}
}
