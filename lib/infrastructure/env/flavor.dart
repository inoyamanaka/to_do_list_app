/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
library;
// ignore_for_file: prefer_constructors_over_static_methods

class FlavorSettings {
  FlavorSettings({required this.flavorName, required this.apiBaseUrl});
  final String flavorName;
  final String apiBaseUrl;

  static FlavorSettings development() {
    return FlavorSettings(
      flavorName: 'development',
      apiBaseUrl: 'https://to-do-list-app-backend.vercel.app/',
    );
  }

  static FlavorSettings stagging() {
    return FlavorSettings(
      flavorName: 'development',
      apiBaseUrl: 'https://192.168.100.30:8000/',
    );
  }
}
