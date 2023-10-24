import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/FormModalData.dart';
import '../../datePicker.dart';



class CustomDialogController extends GetxController {
  List<String> controlList = [
    "Select Controls",
    "TextField",
    "SelectBox",
    "Range",
    "DatePicker",
    "MultiSelectBox",
    "MultiLineTextField"
  ];
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
  var type = "".obs;
  FormControl? formControl;
  var mValidator = <String, dynamic>{}.obs;
  var mOption = [];
  var isRequired = false.obs;
  var rangeSlider = 1.0.obs;

  // initialize the variable to store form data

  var title = "".obs;
  var name = "".obs;
  var options = TextEditingController();
  var label = "".obs;
  var validator = Validator(min: 1, max: 10, minLength: 10, maxLength: 20);
  var inputType = "".obs;
  RxList<FormControl> formControlList = <FormControl>[].obs;

  void createControl() {
    var list = FormControl(
        id: "controlId",
        formId: "formManagerId",
        // validator: validator,
        groupId: "formGroupId",
        label: label.value,
        title: title.value,
        type: type.value,
        required: isRequired.value,
        mode: "mob",
        readonly: null,
        name: name.value,
        options: List.from(mOption),
        validator: mValidator,
        disabled: false,
        inputType: inputType.value,
        placeholder: null,
        position: 65536,
        value: null);
    formControlList.add(list);
    update();
    inputType.value ="default";
    mOption.clear();
    name.value ="";

  }

  void addTextField() {
    dynamicWidgets.add(
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Input Type"),
          SizedBox(
            height: 8,
          ),
          DropdownButtonFormField<String>(
            value: "Text",
            onChanged: (value) {
              // Add your logic here
            },
            items: (["Text", "Number", "Password", "Email", "TextPassword"])
                .map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem<String>(
                value: item.toString(),
                child: Text(item.toString()),
                onTap: () {
                  inputType.value = item;
                },
              );
            }).toList(),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 8,
          ),


          TextField(
            onChanged: (value) {
              name.value = value;
            },
            decoration: InputDecoration(
                hintText:
                formControl != null ? "${formControl?.name}" : 'Name',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),



          TextField(
            onChanged: (value) {
              title.value = value;
            },
            decoration: InputDecoration(
                hintText:
                    formControl != null ? "${formControl?.title}" : 'Title',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              label.value = value;
            },
            decoration: InputDecoration(
                hintText:
                    formControl != null ? "${formControl?.label}" : 'Label',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              print(value);
              mValidator.value['min'] = value;
            },
            decoration: InputDecoration(
                hintText: formControl != null
                    ? '${formControl?.getValidatorMinMax('min')}'
                    : 'Min Length',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),

          TextField(
            onChanged: (value) {
              print(value);
              mValidator.value['max'] = value;
            },
            decoration: InputDecoration(
                hintText: formControl != null
                    ? '${formControl?.getValidatorMinMax('max')}'
                    : 'Max Length',
                border: OutlineInputBorder()),
          ),

          // DynamicTextField(hint: "Max Length"),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: isRequired.value,
                    onChanged: (value) {
                      isRequired.value = value!;
                    }),
              ),
              Text("Required")
            ],
          ),
        ],
      )),
    );
    update();
  }

  void addRange() {
    dynamicWidgets.add(
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Range"),
          SizedBox(
            height: 4,
          ),
          Obx(
            () => Slider(
              max: 10.0,
              min: 1.0,
              onChanged: (value) {
                rangeSlider.value = value;
              },
              value: rangeSlider.value,
            ),
          ),
          SizedBox(
            height: 4,
          ),

          TextField(
            onChanged: (value) {
              name.value = value;
            },
            decoration: InputDecoration(
                hintText:
                formControl != null ? "${formControl?.name}" : 'Name',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),

          TextField(
            onChanged: (value) {
              title.value = value;
            },
            decoration: InputDecoration(
                hintText:
                    formControl != null ? "${formControl?.title}" : 'Title',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              label.value = value;
            },
            decoration: InputDecoration(
                hintText:
                    formControl != null ? "${formControl?.label}" : 'Label',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              mValidator.value['min'] = value;
            },
            decoration: InputDecoration(
                hintText: formControl != null
                    ? '${formControl?.getValidatorMinMax('min')}'
                    : 'Min Length',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              mValidator.value['max'] = value;
            },
            decoration: InputDecoration(
                hintText: formControl != null
                    ? '${formControl?.getValidatorMinMax('max')}'
                    : 'Max Length',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: isRequired.value,
                    onChanged: (value) {
                      isRequired.value = value!;
                    }),
              ),
              Text("Required")
            ],
          ),
        ],
      )),
    );
    update();
  }

  void addMultiLineText() {
    dynamicWidgets.add(Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration:
              InputDecoration(hintText: 'Title', border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration:
              InputDecoration(hintText: 'Label', border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'Min Value', border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'Max Value', border: OutlineInputBorder()),
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: isRequired.value,
                  onChanged: (value) {
                    isRequired.value = value!;
                  }),
            ),
            Text("Required")
          ],
        ),
      ],
    )));
    update();
  }

  void addSelectBox() {
    dynamicWidgets.add(Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),

        TextField(
          onChanged: (value) {
            name.value = value;
          },
          decoration: InputDecoration(
              hintText:
              formControl != null ? "${formControl?.name}" : 'Name',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),

        TextField(
          onChanged: (value) {
            title.value = value;
          },
          decoration: InputDecoration(
              hintText: formControl != null ? "${formControl?.title}" : 'Title',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          onChanged: (value) {
            label.value = value;
          },
          decoration: InputDecoration(
              hintText: formControl != null ? "${formControl?.label}" : 'Label',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(

          controller: options,
          decoration: InputDecoration(
              hintText: formControl != null ? "${formControl?.options[0]} ..." : 'Options',
              border: OutlineInputBorder()),
        ),
        formControl != null ?
        Wrap(
          spacing: 8.0, // spacing between the chips
          children: (formControl?.options ?? []).map<Widget>((dynamic item) {
            if (item is String) {
              return Chip(
                label: Text(item),
              );
            } else {
              return SizedBox.shrink(); // Return an empty container if item is not a string
            }
          }).toList(),
        )
        :Container(),

        SizedBox(
          height: 4,
        ),
        ElevatedButton(onPressed: () {
          mOption.add(options.text);

          options.text = "";

        }, child: Text("Add")),
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: isRequired.value,
                  onChanged: (value) {
                    isRequired.value = value!;
                  }),
            ),
            Text("Required")
          ],
        ),
      ],
    )));
    update();
  }

  void addDatePicker() {
    dynamicWidgets.add(Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DatePickerWidget(),
          SizedBox(
            height: 4,
          ),
          TextField(
            onChanged: (value) {
              title.value = value;
            },
            decoration: InputDecoration(
                hintText:
                formControl != null ? "${formControl?.name}" : 'Name',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 4,
          ),

          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: isRequired.value,
                    onChanged: (value) {
                      isRequired.value = value!;
                    }),
              ),
              Text("Required")
            ],
          ),
        ],
      ),
    ));
  }

  void GetDialog(String value, FormControl? data) {
    formControl = data;
    switch (value) {
      case 'text':
        dynamicWidgets.clear();
        addTextField();
        break;
      case 'date_picker':
        dynamicWidgets.clear();
        addDatePicker();

        break;
      case 'range':
        dynamicWidgets.clear();
        addRange();
        break;
      case 'multiLine':
        print('multiLine ');
        dynamicWidgets.clear();
        addMultiLineText();
        break;

      case 'select':
        dynamicWidgets.clear();
        addSelectBox();
        break;

      default:
        print('default ');
    }
  }

  @override
  void onInit() {
//todo invoke this
    super.onInit();
  }

  Widget DynamicTextField({String hint = 'Text', int max = 20, int min = 1}) {
    return TextField(
      decoration: InputDecoration(hintText: hint, border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      minLines: min,
      maxLength: max,
    );
  }
}
