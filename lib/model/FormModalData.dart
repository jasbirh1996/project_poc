
class DynamicFormModel {
  String id;
  String title;
  String? description;
  String mode;
  String styleType;

  // DateTime lastActivity;
  List<FormGroup> formGroups;

  DynamicFormModel({
    required this.id,
    required this.title,
    this.description,
    required this.mode,
    required this.styleType,
    // required this.lastActivity,
    required this.formGroups,
  });

  factory DynamicFormModel.fromJson(Map<String, dynamic> json) {
    return DynamicFormModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      mode: json['mode'],
      styleType: json['styleType'],
      // lastActivity: DateTime.fromMillisecondsSinceEpoch(
      //     (json['lastActivity']['seconds'] as int) * 1000 +
      //         json['lastActivity']['nanoseconds'] ~/ 1000000),
      formGroups: (json['formGroups'] as List<dynamic>)
          .map((e) => FormGroup.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'mode': mode,
      'styleType': styleType,
      'formGroups': formGroups.map((group) => group.toJson()).toList(),
    };
  }

}

class FormGroup {
  String id;
  String formId;
  String title;
  String? description;
  String position;
  List<FormControl> controls;

  FormGroup({
    required this.id,
    required this.formId,
    required this.title,
    this.description,
    required this.position,
    required this.controls,
  });

  factory FormGroup.fromJson(Map<String, dynamic> json) {
    return FormGroup(
      id: json['id'],
      formId: json['formId'],
      title: json['title'],
      description: json['description'],
      position: json['position'],
      controls: (json['controls'] as List<dynamic>)
          .map((e) => FormControl.fromJson(e))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'formId': formId,
      'title': title,
      'description': description,
      'position': position,
      'controls': controls.map((control) => control.toJson()).toList(),
    };
  }


}

class Validator {
  int min;
  int max;
  int minLength;
  int maxLength;

  Validator(
      {required this.min,
      required this.max,
      required this.minLength,
      required this.maxLength});

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
        min: json['min'],
        max: json['max'],
        minLength: json['minLength'],
        maxLength: json['maxLength']);
  }
}

class FormControl {
  String id;
  String formId;
  String groupId;
  String label;
  String title;
  String type;
  bool required;
  String mode;
  bool? readonly;
  String name;
  dynamic options;
  dynamic validator;
  bool disabled;
  String inputType;
  String? placeholder;
  int position;
  dynamic value;

  FormControl({
    required this.id,
    required this.formId,
    required this.groupId,
    required this.label,
    required this.title,
    required this.type,
    required this.required,
    required this.mode,
    required this.readonly,
    required this.name,
    required this.options,
     this.validator,
    required this.disabled,
    required this.inputType,
    this.placeholder,
    required this.position,
    required this.value,
  });

  factory FormControl.fromJson(Map<String, dynamic> json) {
    return FormControl(
      id: json['id'],
      formId: json['formId'],
      groupId: json['groupId'],
      label: json['label'],
      title: json['title'],
      type: json['type'],
      required: json['required'],
      mode: json['mode'],
      readonly: json['readonly'],
      name: json['name'],
      options: json['options'],
      validator: json['validators'],
      disabled: json['disabled'],
      inputType: json['inputType'],
      placeholder: json['placeholder'],
      position: json['position'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'formId': formId,
      'groupId': groupId,
      'label': label,
      'title': title,
      'type': type,
      'required': required,
      'mode': mode,
      'readonly': readonly,
      'name': name,
      'options': options,
      'validator': validator?.toJson(), // Convert validator to JSON
      'disabled': disabled,
      'inputType': inputType,
      'placeholder': placeholder,
      'position': position,
      'value': value,
    };
  }

  String getValidatorMinMax(String value) {
    if (validator != null && validator is Map<String, dynamic>) {
      String? min = validator!['min'];
      String? max = validator!['max'];

      if (min != null && max != null) {
        if(value == 'min'){
          return min;
        }
        if(value == 'max'){
          return max;
        }

      }
    }
  return '';
  }


}
