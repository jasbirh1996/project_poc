import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../model/FormModalData.dart';

class LoadProfessionalFormController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Rx<DynamicFormModel?> firebaseFormManager = Rx<DynamicFormModel?>(null);

  StreamSubscription<DocumentSnapshot>? _subscription;

  void getFormFromFirestore(String formId) {
    _subscription = _firestore.collection('formManager').doc(formId).snapshots().listen((document) {
      if (document.exists) {
        var formData = document.data() as Map<String, dynamic>;
        firebaseFormManager.value = DynamicFormModel.fromJson(formData);
      } else {
        firebaseFormManager.value = null;
      }
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    getFormFromFirestore("formManagerId");
    super.onInit();
  }
}