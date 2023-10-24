

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/FormModalData.dart';

class ProController extends GetxController{

  // RxList<FormGroup> formGroupList = <FormGroup>[].obs;
  List<FormGroup> formGroupList = <FormGroup>[];




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  Widget NiceCard(String title){
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0), // Rounded border
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  void createFormGroupList(List<FormControl> list,String title , String description){
    var formGroup = FormGroup(
      id: "formGroupId",
      formId: "formManagerId",
      title: title,
      description: description,
      controls: List.from(list),
      position: ""
    );
    formGroupList.add(formGroup);
  var gData = formGroupList;
  print(gData);

  }
}