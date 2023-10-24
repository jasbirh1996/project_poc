import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_poc/dashboard/professional/proV2/FormBuilder.dart';
import 'package:project_poc/dashboard/professional/proV2/controller/MainScreenController.dart';
import 'package:project_poc/onboarding/StartPage.dart';
import 'package:project_poc/util/AppConstant.dart';
import 'package:project_poc/util/SharedPrefrence.dart';

import '../../auth/controller/AuthController.dart';



class Mainscreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  var controller = Get.put(MainScreenConroller());

  @override
  Widget build(BuildContext context) {

  controller.getEmail();


  return Scaffold(
    appBar: AppBar(
      title:  Text('Welcome Professional'),
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Email:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
               Obx(() =>
                   Text(
                     '${controller.userEmail}',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 16.0,
                     ),
                   ),
               )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_calendar_sharp),
            title: const Text('Form Manager'),
            onTap: () {
              Get.to(FormManager());
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {

              _authController.signOut();
              Get.to(const StartPage());
              // Add navigation logic here
            },
          ),
          // Add more ListTiles for additional options
        ],
      ),
    ),
    body: const Center(
      child: Text('Main Content'),
    ),
  );
  }


}
