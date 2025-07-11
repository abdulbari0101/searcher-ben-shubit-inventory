import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory/app.dart';
import 'package:inventory/services/app_services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initialServices();
  runApp(const App());
}

Future<void> initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
