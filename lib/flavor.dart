import 'package:flutter/material.dart';

enum Flavor { DEV, QA, PRODUCTION }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String configFilename;
  final Color color;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    String fileName = 'app_config.json',
    Color color: Colors.blue,
  }) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.toString(), fileName, color);
    return _instance;
  }

  FlavorConfig._internal(
      this.flavor, this.name, this.configFilename, this.color);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isQA() => _instance.flavor == Flavor.QA;
}
