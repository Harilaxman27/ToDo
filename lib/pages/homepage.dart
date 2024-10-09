import 'package:flutter/material.dart';
import 'package:todo/util/dialoguebox.dart';
import 'package:todo/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();
  List toDolist = [
    ["Study", false],
    ["Gym", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  void saveNewtask() {
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialoguebox(
          controller: _controller,
          onSave: saveNewtask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true, // Center the title
        titleTextStyle: const TextStyle(
          color: Colors.black, // Set the font color to black
          fontSize: 24, // Adjust the font size if needed
          fontWeight: FontWeight.bold, // Optional, bold text
        ),
        backgroundColor: Colors.yellow[700], // Match the background with the yellow theme
        elevation: 10, // Add elevation to create a shadow
        shadowColor: Colors.grey.withOpacity(0.5), // Customize the shadow color if needed
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDolist[index][0],
            taskCompleted: toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
