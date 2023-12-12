

import 'package:dr_booking/view/screens/form/initial_form1.dart';
import 'package:dr_booking/view/screens/form/initial_form2_screen.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/screens/progress_form/progress_form_screen.dart';
import 'package:dr_booking/view/screens/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String initialForm = "/initial_from_screen";
  static const String initialForm2= "/initial_from2_screen";
  static const String preogressSreen= "/progress_from2_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: initialForm, page: () => const InitialForm1Screen()),
    GetPage(name: initialForm2, page: () => const InitialForm2Screen()),
    GetPage(name: preogressSreen, page: () => const ProgressFormScreen()),
  ];
}
