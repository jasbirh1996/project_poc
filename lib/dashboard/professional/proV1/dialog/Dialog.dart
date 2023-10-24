
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../model/FormModalData.dart';
import '../controller/CustomDialogController.dart';

class CustomDialog extends StatelessWidget {
  CustomDialogController dialogController = Get.put(CustomDialogController());

  String title;
  FormControl? formControl;
  CustomDialog({required this.title,  this.formControl});


  @override
  Widget build(BuildContext context) {
    dialogController.type.value = title;
    dialogController.GetDialog(title,formControl);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );

  }



  Widget dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Controls"),
          SizedBox(height: 16,),
          Expanded(
            child: Obx(
                  () =>
                  ListView.separated(
                    itemCount: dialogController.dynamicWidgets.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10), // Adjust the height as needed
                    itemBuilder: (BuildContext context, int index) {
                      return dialogController.dynamicWidgets[index];
                    },
                  ),
            ),
          ),
         Row(
           children: [
             formControl !=null?
                 Container()
            : Align(
               alignment: Alignment.bottomLeft,
               child: TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: Text(
                   "Cancel",
                   style: TextStyle(fontSize: 18.0, color: Colors.blue),
                 ),
               ),
             )
             ,
             Spacer(),
             formControl !=null?
             Align(
               alignment: Alignment.bottomLeft,
               child: TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: Text(
                   "Dismiss",
                   style: TextStyle(fontSize: 18.0, color: Colors.blue),
                 ),
               ),
             )

                 :
             Align(
               alignment: Alignment.bottomRight,
               child: TextButton(
                 onPressed: () {
                   dialogController.dynamicWidgets.clear();
                   dialogController.rangeSlider.value = 1.0;
                   dialogController.createControl();
                   var list = dialogController.formControlList;
                   print(list);
                   Navigator.pop(context);
                 },
                 child: Text(
                   "Submit",
                   style: TextStyle(fontSize: 18.0, color: Colors.blue),
                 ),
               ),
             ),
           ],
         )
        ],
      ),
    );
  }
}



