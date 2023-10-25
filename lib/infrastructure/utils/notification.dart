// ignore_for_file: strict_raw_type

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

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

    // const AndroidInitializationSettings('ic_launcher');
    final now = tz.TZDateTime.now(tz.getLocation(timeZoneName));

    if (scheduledTime.isBefore(now) == true) {
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
