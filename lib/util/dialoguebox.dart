import 'package:flutter/material.dart';
import 'package:todo/util/buttons.dart';
class Dialoguebox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialoguebox({super.key,required this.controller,required this.onCancel,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Add a New Task"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButtons(text: "Save", onPressed: onSave),
              MyButtons(text: "Cancel", onPressed: onCancel)
            ],
          )
        ],),
      ),
    );
  }
}