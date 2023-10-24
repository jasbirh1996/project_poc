import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_poc/dashboard/professional/render_json_ui/DaynamicClass.dart';
import 'package:project_poc/dashboard/user/controller/UserPageController.dart';
import 'package:project_poc/onboarding/StartPage.dart';

import '../../auth/controller/AuthController.dart';
import '../../util/AppConstant.dart';
import '../../util/SharedPrefrence.dart';
import 'LoadProfessionalForm.dart';



class UserPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  var controller = Get.put(UserPageController());
  @override
  Widget build(BuildContext context) {

    controller.getEmail();
    return Scaffold(
      appBar: AppBar(
        title:  Text('Welcome User'),
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
              leading: const Icon(Icons.settings),
              title: const Text('Submit Form'),
              onTap: () {
                // Add navigation logic here
                Get.to(LoadProfessionalForm());
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
