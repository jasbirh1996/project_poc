


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicFormJson extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  DynamicFormJson({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    List<dynamic> controls = jsonData['formGroups'][0]['controls'];

    return SingleChildScrollView(  // Wrap the Column in a SingleChildScrollView
      child: Column(
        children: controls.map<Widget>((control) {
          if (control['type'] == 'text') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: control['label']),
              ),
            );
          } else if (control['type'] == 'toggle') {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: Text(control['label']),
                value: control['value'] ?? false,
                onChanged: (value) {},
              ),
            );
          }
          else if (control['type'] == 'spinner') {
            List<String> items = List<String>.from(control['options']['items']);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material( // Wrap DropdownButton with Material widget
                child: DropdownButtonFormField(
                  decoration: InputDecoration(labelText: control['label']),
                  value: control['value'] ?? items[0],
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            );
          }
          return SizedBox.shrink();
        }).toList(),
      ),
    );
  }
}