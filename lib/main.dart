import 'package:data_on/app.dart';
import 'package:data_on/ui/config/app_config.dart';
import 'package:data_on/ui/config/app_initializer.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer(AppConfig.getInstance()).init();
  runApp(const MyApp());
}
