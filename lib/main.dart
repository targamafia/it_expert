import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/login/application/is_user_first_time_usecase.dart';
import 'package:it_expert/main_controller.dart';
import 'package:it_expert/ui/style.dart';
import 'package:it_expert/ui/user/onboarding/onboarding_page.dart';

import 'core/login/di.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MainController
    return GetMaterialApp(
      title: 'IT Expert',
      theme: lightTheme(),
      home: OnBoardingPage(),
    );
  }
}
