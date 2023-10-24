
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../datePicker.dart';
import '/model/FormModalData.dart';

class DynamicWidget extends StatelessWidget {
  final DynamicFormModel data;

  DynamicWidget({required this.data});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: GetBuilder<MyDataController>(
        init: MyDataController(), // Initialize MyDataController
        builder: (controller) {
          return
            ListView.builder(
              itemCount: data.formGroups.length,
              itemBuilder: (context, index) {
                var formGroup = data.formGroups;
                return Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(formGroup[index].title,style: TextStyle(fontSize: 20,color: Colors.black),),
                      SizedBox(
                        height: 20,
                      ),
                      for (var control in formGroup[index].controls) ...[
                        if (control.type == 'text')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  control.title
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(

                                decoration:
                                InputDecoration(labelText: control.label, border: OutlineInputBorder()),
                                onChanged: (value) {

                                },
                              ),
                            ],
                          ),
                        if (control.type == 'toggle')
                          SwitchListTile(
                            title: Text(control.label),
                            value: control.value,
                            onChanged: (value) {
                              // Add your logic here
                            },
                          ),
                        if (control.type == 'select')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  control.title
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField<String>(

                                onChanged: (value) {
                                  // Add your logic here
                                },
                                items: (control.options as List<dynamic>)
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.toString(),
                                    child: Text(item.toString()),
                                  );
                                }).toList(),
                                value: control.value ?? control.options.first,
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              ),
                            ],
                          ),



                        if (control.type == 'number')
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:
                            InputDecoration(labelText: control.label),
                            onChanged: (value){

                            },
                          ),
                        if (control.type == 'date_picker')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(control.title),
                              SizedBox(height: 8,),
                              DatePickerWidget(),
                            ],
                          ),
                        SizedBox(height: 16),
                        if(control.type =='range')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(control.title),
                              Obx(() =>
                                  Slider(
                                    value: controller.rangeObserver.value,
                                    min: 1.0,
                                    max: 10.0,
                                    onChanged: (value) {
                                      controller.rangeObserver.value = value;
                                      // Add your logic here
                                    },
                                    divisions: ((10 - 1) / 1).toInt(),
                                    label: controller.rangeObserver.value.toInt().round().toString(),
                                  ),)
                            ],
                          )

                      ],
                      SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
        },
      ),
    );
  }
}

class MyDataController extends GetxController {
  var  rangeObserver  = 1.0.obs;


}
