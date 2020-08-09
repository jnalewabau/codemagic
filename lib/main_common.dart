import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config_reader.dart';
import 'flavor.dart';
import 'main.dart';

Future<void> mainCommon(FlavorConfig config) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  Color primaryColor = config.color;

  runApp(
    Provider.value(
      value: primaryColor,
      child: MyApp(),
    ),
  );
}
