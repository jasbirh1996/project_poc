
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'FormGroup.dart';
import 'controller/ProController.dart';


class FormManager extends StatelessWidget {
  var proController = Get.put(ProController());
  var titleFormManager = TextEditingController();
  var descriptionFormManager = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Manager'),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: titleFormManager,
                decoration: InputDecoration(
                    hintText: 'Title', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: descriptionFormManager,
                decoration: InputDecoration(
                    hintText: 'Description', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if(titleFormManager.text.isEmpty && descriptionFormManager.text.isEmpty){
                        Get.snackbar("Error", "Please Enter Title and Description");
                      }else{
                        Get.to(FormGroup(
                          titleFormManager: titleFormManager.text,
                          descriptionManger: descriptionFormManager.text,
                        ));
                      }


                    },
                    child: Text("Next")),
              )
            ],
          ),
        ),
      ),
    );

  }
}
