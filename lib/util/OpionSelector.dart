import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'OptionController.dart';

class OptionSpinner extends StatelessWidget {
  final OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1), // Add horizontal padding
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select an option', // Optional label for the dropdown
                  border: OutlineInputBorder(), // Optional border style
                  contentPadding: EdgeInsets.symmetric(horizontal: 5), // Optional content padding
                ),
                isExpanded: true,
                value: optionController.selectedOption.value,
                items: <String>['Professional', 'User'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  optionController.selectOption(newValue!);
                },
                icon: Icon(Icons.arrow_drop_down), // Custom dropdown icon
                iconSize: 36, // Adjust the icon size if needed
                iconEnabledColor: Colors.black, // Color of the icon
              ),
            ),
          ],
        ),
      );
    });
  }
}






