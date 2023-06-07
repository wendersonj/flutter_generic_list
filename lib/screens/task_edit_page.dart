import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';

class TaskEdit extends StatelessWidget {
  Task task;
  TaskEdit({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Task task = this.task;
    print(task);
    return Scaffold(
        appBar: AppBar(
          title: Text("TaskList"),
        ),
        body: Center(child: Text("")));
  }
}
