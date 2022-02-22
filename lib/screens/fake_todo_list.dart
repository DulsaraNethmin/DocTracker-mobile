import 'package:doctracker/services/todo_services.dart';
import 'package:doctracker/widgets/button_simple.dart';
import 'package:flutter/material.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management Test'),
      ),
      body: SafeArea(
        child: Center(
          child: Button(() {
            ToDoService td = new ToDoService();
            print('screen');
            td.getTodo();
          }, 'ToDo'),
        ),
      ),
    );
  }
}
