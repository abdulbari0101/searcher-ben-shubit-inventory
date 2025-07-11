
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory/bindings/initial_binding.dart';
import 'package:inventory/route.dart';
import 'package:inventory/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext _, Widget? __) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: GetMaterialApp(
          textDirection: TextDirection.rtl,
          themeMode: ThemeMode.light,
          initialBinding: InitialBinding(),
          theme: TAppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          getPages: getPages,
        ),
      ),
    );
  }
}
