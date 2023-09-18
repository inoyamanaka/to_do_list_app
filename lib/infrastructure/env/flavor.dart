import 'package:to_do_list_app/infrastructure/env/env_config.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: ' http://127.0.0.1:8080',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: ' http://127.0.0.1:8080',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: ' http://127.0.0.1:8080',
    );
  }
}
