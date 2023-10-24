import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}

final DatePickerController dateController = Get.put(DatePickerController());

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: dateController.selectedDate.value,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null && pickedDate != dateController.selectedDate.value) {
          dateController.selectDate(pickedDate);
        }
      },
      child: Text("Date Picker"),
    );
  }
}