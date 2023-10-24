import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'DynamicController.dart';

class DynamicWidgetDemo extends StatelessWidget {
  final DynamicController controller = Get.put(DynamicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Widget Demo'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: controller.addSampleWidgit,
                  child: Text('Create Button'),
                ),
              ),
              Spacer(),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: (){controller.addTextField("jasbir");},
                  child: Text('Create Textfield '),
                ),
              ),

            ],
          ),

          Expanded(
            child: Obx(
              () => ListView.separated(
                itemCount: controller.dynamicWidgets.length,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10), // Adjust the height as needed
                itemBuilder: (BuildContext context, int index) {

                  return controller.dynamicWidgets[index];
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


