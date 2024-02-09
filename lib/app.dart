import 'package:firebase_project/utils/constants/app_routes.dart';
import 'package:firebase_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: AAppTheme.lightTheme,
        darkTheme: AAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: AppRoutes.appRoutes,
      ),
    );
  }
}
