// ignore_for_file: strict_raw_type

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_logo');

    final initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }

  Future scheduleNotification({
    required DateTime scheduledNotificationDateTime,
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    // Initialize timezone database
    // final String timeZoneName = 'your_time_zone'; // Ganti dengan zona waktu Anda
    // The device's timezone.

    tz.initializeTimeZones();
    final timeZoneName = tz.local.name;
    final scheduledTime = tz.TZDateTime.from(
      scheduledNotificationDateTime,
      tz.getLocation(timeZoneName),
    );
    final now = tz.TZDateTime.now(tz.getLocation(timeZoneName));

    print(scheduledNotificationDateTime);
    // print(scheduledTime.isBefore(now));
    print(scheduledTime.isAfter(now));

    // if (scheduledTime.isBefore(now) || scheduledTime.isAtSameMomentAs(now)) {
    //   scheduledTime = scheduledTime.add(const Duration(days: 1));
    // } else if (scheduledTime.isAfter(now)) {
    //   print('cell');
    // }

    if (scheduledTime.isBefore(now) == true) {
      print('cell');
      throw Exception('Waktu yang dijadwalkan sudah berlalu');
    }
    return notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
