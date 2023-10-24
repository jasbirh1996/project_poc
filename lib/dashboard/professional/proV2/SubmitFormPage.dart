import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/FormModalData.dart';
import '../render_json_ui/DaynamicClass.dart';
import 'controller/SubmitFormController.dart';

class SubmitFormPage extends StatelessWidget {
  String title;
  String description;
  List<FormGroup> mList;
  var controller = Get.put(SubmitFormController());

  SubmitFormPage(
      {required this.title, required this.description, required this.mList});

  @override
  Widget build(BuildContext context) {
    controller.saveFormManager(title, description, mList);
    controller.uploadToFirestore(controller.formManager);
    controller.printJson("formManagerId");

    return Scaffold(
      body: FutureBuilder<DynamicFormModel?>(
        future: controller.getFormFromFirestore("formManagerId"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading indicator
          } else if (snapshot.hasError || snapshot.data == null) {
            return Text('Error: Data not available');
          } else {
            return Container(
              child: Center(
                child: Card(
                  child: Text("Form Has Been Created",style: TextStyle(
                    color: Colors.green,
                    fontFamily: CupertinoIcons.iconFont,
                    fontSize: 20
                  ),),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}


