import 'package:flutter/material.dart';

import 'flavor.dart';
import 'main_common.dart';

Future<void> main() async {
  var flavor = FlavorConfig(
      flavor: Flavor.PRODUCTION,
      fileName: 'app_config_prod.json',
      color: Colors.green);
  await mainCommon(flavor);
}
