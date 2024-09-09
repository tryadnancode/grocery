import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/routes/app_pages.dart';
import 'package:grocery/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.screen,
      getPages: AppPages.pages,
    );
  }
}
