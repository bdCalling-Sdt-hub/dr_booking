

import 'package:dr_booking/view/screens/about_dr/about_dr_screen.dart';
import 'package:dr_booking/view/screens/form/initial_form1.dart';
import 'package:dr_booking/view/screens/form/initial_form2_screen.dart';
import 'package:dr_booking/view/screens/home/home_screen.dart';
import 'package:dr_booking/view/screens/payment_method/payment_method_screen.dart';
import 'package:dr_booking/view/screens/payment_method/payment_screen.dart';
import 'package:dr_booking/view/screens/progress_form/progress_form_screen.dart';
import 'package:dr_booking/view/screens/setting/about_us_screen.dart';
import 'package:dr_booking/view/screens/setting/contact_us_screen.dart';
import 'package:dr_booking/view/screens/setting/privacy_policy_screen.dart';
import 'package:dr_booking/view/screens/setting/share_screen.dart';
import 'package:dr_booking/view/screens/setting/term_condition_screen.dart';
import 'package:dr_booking/view/screens/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class AppRoute {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String initialForm = "/initial_from_screen";
  static const String initialForm2= "/initial_from2_screen";
  static const String preogressSreen= "/progress_from2_screen";
  static const String paymentScreen= "/paymentScreen_screen";
  static const String makePaymentScreen= "/makePayment_screen";
  static const String aboutDr= "/about_dr_screen";
  static const String termCondition= "/termCondition_screen";
  static const String privacyPolicy= "/privacyPolicy_screen";
  static const String aboutUs= "/about_us_screen";
  static const String contactUsScreen= "/contactUsScreen_screen";
  static const String shareScreen= "/shareScreen_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: initialForm, page: () => const InitialForm1Screen()),
    GetPage(name: initialForm2, page: () => const InitialForm2Screen()),
    GetPage(name: preogressSreen, page: () => const ProgressFormScreen()),
    GetPage(name: paymentScreen, page: () => const PaymentMethodScreen()),
    GetPage(name: makePaymentScreen, page: () =>  PaymentScreen()),
    GetPage(name: aboutDr, page: () => const AboutDrScreen()),
    GetPage(name: termCondition, page: () => const TemrConditionsScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: aboutUs, page: () => const AboutUsScreen()),
    GetPage(name: contactUsScreen, page: () => const ContactUsScreen()),
    GetPage(name: shareScreen, page: () => const ShareScreen()),
  ];
}
