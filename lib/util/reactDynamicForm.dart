/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Routes {
  static const complex = '/';

  static const simple = '/simple';

  static const addDynamicControls = '/add-dynamic-controls';

  static const disableFormSample = '/disable-form-sample';

  static const arraySample = '/array-sample';

  static const datePickerSample = '/date-picker-sample';

  static const reactiveFormWidgets = '/reactive-form-widgets';

  static const loginSample = '/login-sample';
}

class ReactiveFormsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (_) => 'Field is mandatory',
        ValidationMessage.email: (_) => 'Must enter a valid email',
        'uniqueEmail': (_) => 'This email is already in use',
      },
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
          ),
        ),
        routes: <String, WidgetBuilder>{
          Routes.complex: (_) => ComplexSample(),
          Routes.simple: (_) => SimpleSample(),
          Routes.addDynamicControls: (_) => AddDynamicControlsSample(),
          Routes.disableFormSample: (_) => DisableFormSample(),
          Routes.arraySample: (_) => ArraySample(),
          Routes.loginSample: (_) => LoginSample(),
          Routes.datePickerSample: (_) => DatePickerSample(),
          //Routes.reactiveFormWidgets: (_) => ReactiveFormWidgetsSample(),
        },
      ),
    );
  }
}*/
