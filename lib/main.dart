// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/views/Screens/signInScreen.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

import 'l10n/L10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized().obs();
  await EasyLocalization.ensureInitialized().obs();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/l10n'.obs(),
    fallbackLocale: L10n.all[0],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: context.localizationDelegates.obs(),
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SignInScreen(),
        navigatorKey: Get.key,
      );
}
