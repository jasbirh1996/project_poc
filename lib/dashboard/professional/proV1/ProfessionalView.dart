
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog/Dialog.dart';


class ProfessionalView extends StatelessWidget {
  const ProfessionalView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfessionalController>(init: ProfessionalController(),builder: (controller){
      return Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(title: "Control");
                },
              );
            },
            child: Text("Add Controls"),
          ),
          SizedBox(height: 16),



        ],
      );


    });
  }
}

class ProfessionalController extends GetxController {
}

class DynamicDialog extends StatelessWidget {
  List<String> list;
  String type;
  String label;
   DynamicDialog({required this.type,required this.label, required this.list});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text('TextField'),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("InputType:",style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 4),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: "Text",
              onChanged: (value) {
                // Add your logic here
              },
              items: (["Text","Number","Password","Email","TextPassword"])
                  .map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(item.toString()),
                );
              }).toList(),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 4),
          Text("Title:",style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 4),
          Expanded(
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder()),),
          ),
          SizedBox(height: 4),
          Text("Lebal:",style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 4),
          Expanded(
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder()),),
          ),
          SizedBox(height: 4),


          Text("Min:",style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 4),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: "5",
              onChanged: (value) {
                // Add your logic here
              },
              items: (["5","15","18","20"])
                  .map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(item.toString()),
                );
              }).toList(),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 4),
          Text("Max:",style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 4),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: "20",
              onChanged: (value) {
                // Add your logic here
              },
              items: (["20","18","15","5",])
                  .map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(item.toString()),
                );
              }).toList(),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),




        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}





