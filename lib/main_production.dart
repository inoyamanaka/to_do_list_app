// ignore_for_file: inference_failure_on_function_invocation

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_list_app/app/app.dart';
import 'package:to_do_list_app/bootstrap.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';
import 'package:to_do_list_app/infrastructure/env/env_config.dart';
import 'package:to_do_list_app/infrastructure/env/flavor.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  tz.initializeTimeZones();

  await Hive.initFlutter();

  // Hive.registerAdapter<DataModel>(DataModelAdapter());
  await Hive.openBox(databaseBox);

  FlavorSettings.development();
  await bootstrap(App.new);

  ///[console] flavor running
  if (!kReleaseMode) {
    final settings = EnvConfig.getInstance();
    log('🚀 APP FLAVOR NAME      : ${settings.apiBaseUrl}', name: 'ENV');
    log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
  }
}
