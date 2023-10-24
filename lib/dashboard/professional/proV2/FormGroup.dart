
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/FormModalData.dart';
import '../proV1/controller/CustomDialogController.dart';
import '../proV1/dialog/Dialog.dart';
import 'SubmitFormPage.dart';
import 'controller/ProController.dart';

class FormGroup extends StatelessWidget {
  var titleFormManager;
  var descriptionManger;
  FocusNode myFocusNode = FocusNode();
  var proController = Get.put(ProController());
  var customDialogController = Get.put(CustomDialogController());
  var formGroupTitle = TextEditingController();
  var formGroupDescription = TextEditingController();
  var formControllerTempList = <FormControl>[];

  FormGroup({required this.titleFormManager, required this.descriptionManger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Group '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), // Choose your desired icon here
            onPressed: () {
              if (customDialogController.formControlList.length > 0) {
                formControllerTempList = customDialogController.formControlList;

                proController.createFormGroupList(
                    formControllerTempList,
                    formGroupTitle.text,
                    formGroupDescription.text);


                Get.snackbar(
                  'Form group',
                  'Added successfully, You can proceed to save',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  borderRadius: 10.0,
                  margin: EdgeInsets.all(10.0),
                );

                customDialogController.formControlList.clear();
                formGroupTitle.text = "";
                formGroupDescription.text = "";


              } else {
                Get.snackbar(
                  'Form group',
                  'Controls are empty please add control',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  borderRadius: 10.0,
                  margin: EdgeInsets.all(10.0),
                );
              }

              // Add your onPressed behavior here
            },
          ),
          IconButton(
            icon: Icon(Icons.save), // Choose your desired icon here
            onPressed: () {
              if (proController.formGroupList.length > 0 ) {
                Get.to(SubmitFormPage(
                    title: titleFormManager,
                    description: descriptionManger,
                    mList: proController.formGroupList));
              } else {
                Get.snackbar(
                  'Form group',
                  'Please complete the Form Group ',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  borderRadius: 10.0,
                  margin: EdgeInsets.all(10.0),
                );
              }

              // Add your onPressed behavior here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: formGroupTitle,
            decoration: InputDecoration(
                hintText: 'Title', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            focusNode: myFocusNode,
            controller: formGroupDescription,
            decoration: InputDecoration(
                hintText: 'Description', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 8,
          ),
          // This Row contains two Expanded widgets
          Expanded(
            child: Row(
              children: <Widget>[
                // The first widget takes 60% of the available space
                Expanded(
                    flex: 6,
                    child: Obx(() => ListView.builder(
                          itemCount:
                              customDialogController.formControlList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.control_camera_outlined,
                                    color: Colors.white),
                              ),
                              title: Text(
                                '${customDialogController.formControlList[index].type.toUpperCase()}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                ' ${customDialogController.formControlList[index].title}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                print("itemClicked");
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialog(
                                      title: customDialogController
                                          .formControlList[index].type,
                                      formControl: customDialogController
                                          .formControlList[index],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ))),

                Expanded(
                  flex: 4,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: proController.NiceCard("Text"),
                            onTap: () {
                              myFocusNode.unfocus();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {

                                  return CustomDialog(title: "text");
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            child: proController.NiceCard("Select"),
                            onTap: () {
                              myFocusNode.unfocus();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(title: "select");
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            child: proController.NiceCard("Range"),
                            onTap: () {
                              myFocusNode.unfocus();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(title: "range");
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            child: proController.NiceCard("Date"),
                            onTap: () {
                              myFocusNode.unfocus();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(title: "date_picker");
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
