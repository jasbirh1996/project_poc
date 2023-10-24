import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DynamicFormController extends GetxController {
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
}

class DynamicJsonForm extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  DynamicJsonForm({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DynamicFormController());

    List<dynamic> controls = jsonData['formGroups'][0]['controls'];

    controls.forEach((control) {
      if (control['type'] == 'text') {
        controller.dynamicWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: control['label']),
            ),
          ),
        );
      } else if (control['type'] == 'toggle') {
        controller.dynamicWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              title: Text(control['label']),
              value: control['value'] ?? false,
              onChanged: (value) {},
            ),
          ),
        );
      } else if (control['type'] == 'spinner') {
        List<String> items = List<String>.from(control['options']['items']);
        controller.dynamicWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(labelText: control['label']),
              value: control['value'] ?? items[0],
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ),
        );
      }
    });

    return GetBuilder<DynamicFormController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: controller.dynamicWidgets,
        ),
      ),
    );
  }
}

