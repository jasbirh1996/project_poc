import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_poc/dashboard/user/controller/LoadProfessionalFormController.dart';

import '../../../model/FormModalData.dart';
import '../professional/render_json_ui/DaynamicClass.dart';


class LoadProfessionalForm extends StatelessWidget {
  var controller = Get.put(LoadProfessionalFormController());

  LoadProfessionalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var snapshot = controller.firebaseFormManager.value;

        if (snapshot == null) {
          return Center(child: Text("No Form Available",style: TextStyle(fontSize: 20),));
        } else if (snapshot == false) {
          return Text('Error: Data not available');
        } else {
          return DynamicWidget(data: snapshot!);
        }
      }),
    );
  }
}