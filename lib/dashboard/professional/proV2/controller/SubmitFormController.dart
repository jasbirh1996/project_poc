import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../model/FormModalData.dart';

class SubmitFormController extends GetxController {
  late DynamicFormModel formManager;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late DynamicFormModel firebaseFormManager;

  DynamicFormModel saveFormManager(
      String title, String description, List<FormGroup> list) {
    formManager = DynamicFormModel(
      id: "formManagerId",
      title: title,
      description: description,
      mode: "mob",
      formGroups: list,
      styleType: "",
    );
    print(formManager);
    var json = formManager.toJson();
    print(json);
    return formManager;
  }

  void uploadToFirestore(DynamicFormModel dynamicForm) async {
    try {
      await _firestore.collection('formManager').doc(dynamicForm.id).set(
        dynamicForm.toJson(),
      );

      print('Uploaded successfully');
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  Future<DynamicFormModel?> getFormFromFirestore(String formId) async {
    try {
      var document = await _firestore.collection('formManager').doc(formId).get();

      if (document.exists) {
        var formData = document.data() as Map<String, dynamic>;
        firebaseFormManager = DynamicFormModel.fromJson(formData);
        update();
        return DynamicFormModel.fromJson(formData);
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
  }
  void printJson(String data) async{
    var formId = data;
    var dynamicForm = await getFormFromFirestore(formId);

    if (dynamicForm != null) {
      print(dynamicForm.toJson());
      print("jasbir success");
      // Do something with the retrieved DynamicFormModel
    } else {
      print('Form not found or an error occurred.');
    }
  }
  @override
  void onInit() {
    firebaseFormManager = DynamicFormModel(
      id: "",
      title: "",
      description: "",
      mode: "",
      formGroups: [],
      styleType: "",
    );

    super.onInit();
  }
}
