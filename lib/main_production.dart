// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_list_app/app/app.dart';
import 'package:to_do_list_app/bootstrap.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_data_request.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/infrastructure/constants/constant.dart';
import 'package:to_do_list_app/infrastructure/env/flavor.dart';
import 'package:to_do_list_app/infrastructure/utils/notification.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Timer(const Duration(seconds: 1), FlutterNativeSplash.remove);
  await NotificationService().initNotification();
  tz.initializeTimeZones();

  await Hive.initFlutter();

  Hive
    ..registerAdapter<Activity>(ActivityAdapter())
    ..registerAdapter<DataModel>(DataModelAdapter())
    ..registerAdapter<StatisticDataModel>(StatisticDataModelAdapter());

  await Hive.openBox(tokenBox);
  await Hive.openBox(databaseBox);
  await Hive.openBox(activityBox);
  await Hive.openBox(onBoarding);

  FlavorSettings.development();
  await bootstrap(() => const App());

  ///[console] flavor running
  if (!kReleaseMode) {
    log('🚀 APP FLAVOR NAME      : Development');
    log('🚀 APP API_BASE_URL     : ${FlavorSettings.development().apiBaseUrl}');
  }
}
