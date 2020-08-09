import 'dart:convert';
import 'package:flutter/services.dart';

import 'flavor.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialize(FlavorConfig config) async {
    // Fallback to a standar app configuration if the config specific asset isn't found
    var fallBack = false;

    // Attempt to load the configuration file passed in the config
    try {
      var configString =
          await rootBundle.loadString('config/' + config.configFilename);
      _config = json.decode(configString) as Map<String, dynamic>;
    } catch (ex) {
      fallBack = true;
    }

    // Couldn't read the flavor specific configuration file - default to basic one
    if (fallBack) {
      var configString = await rootBundle.loadString('config/app_config.json');
      _config = json.decode(configString) as Map<String, dynamic>;
    }
  }

  static int getIncrementAmount() {
    return _config['incrementAmount'] as int;
  }

  static String getSecretKey() {
    return _config['secretKey'] as String;
  }
}
