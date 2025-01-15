import 'package:crepto/Theme/style.dart';
import 'package:crepto/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/change_themes_controller.dart';
import 'package:crepto/Theme/colors.dart';

void main() {
  // Initialize ThemeController before running the app
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),  // Make sure SplashScreen is also imported correctly
    );
  }
}
