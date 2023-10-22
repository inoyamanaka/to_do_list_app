import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/app/view/splash.dart';
import 'package:to_do_list_app/features/crud/controller/crud_bindings.dart';
import 'package:to_do_list_app/infrastructure/navigation/navigation.dart';
import 'package:to_do_list_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Hive.box( tokenBox);

    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      getPages: Nav.routes,
      initialBinding: CrudBinding(),
      home: const SplashScreen(),
    );
  }
}
