import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/notificationCenter/notification_service.dart';
import 'package:uiwidgets/basics/notificationCenter/pages/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();

  runApp(MaterialApp(home: HomePage()));
}
