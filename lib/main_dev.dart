import 'package:flutter/material.dart';

import 'flavor.dart';
import 'main_common.dart';

Future<void> main() async {
  var flavor = FlavorConfig(
      flavor: Flavor.DEV,
      fileName: 'app_config_dev.json',
      color: Colors.orange);
  await mainCommon(flavor);
}
