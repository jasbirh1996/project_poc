import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_poc/dashboard/professional/MainScreen.dart';
import 'package:project_poc/dashboard/user/UserPage.dart';
import 'package:project_poc/onboarding/StartPage.dart';
import 'package:project_poc/util/AppConstant.dart';
import 'package:project_poc/util/DynamicForm.dart';
import 'package:project_poc/util/DynamicFormBasedOnJson.dart';
import 'package:project_poc/util/SharedPrefrence.dart';

import 'auth/controller/AuthController.dart';
import 'exp/dynamicFormController.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( MyApp());
  });


}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final AuthController authController = Get.put(AuthController()); // Initialize AuthController

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StartPage(),

    );
  }

}
