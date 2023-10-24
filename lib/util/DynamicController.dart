import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DynamicController extends GetxController {
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
  var textController = TextEditingController();

  void addTextField(String value) {
    dynamicWidgets.add(
      Container(
        margin:  EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
            labelText: value,
          ),
        ),
      ),
    );
    update();
  }
  void dynamiForm(){


  }

  void addSampleWidgit() {
    dynamicWidgets.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {

          dynamicWidgets.add(TextListWidget());

          update();
        },
        child: Text("save"),
      ),
    ));
  }
}

class TextListController extends GetxController {
  final savedTexts = <String>[].obs;

  void addText(String newText) {
    if (newText.isNotEmpty) {
      savedTexts.add(newText);
    }
  }
}

class TextListWidget extends StatelessWidget {
  final TextListController controller = Get.put(TextListController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Enter Text',
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.addText(textController.text);
                  textController.clear();
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Saved Texts'),
                        content: Obx(() => DropdownButton<String>(
                          isExpanded: true,

                          items: controller.savedTexts.map((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // Do something with the selected value
                          },
                        )),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


