import 'package:dr_booking/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      navigatorKey: Get.key,
     initialRoute: AppRoute.splashScreen,
    );
  }
}

