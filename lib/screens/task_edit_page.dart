import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:lista_tarefas/screens/task_list_page.dart';

class TaskEdit extends StatelessWidget {
  Task task;
  TaskEdit({super.key, required this.task});
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Task task = this.task;
    print(task);
    TextEditingController titleCtrl =
        TextEditingController(text: task.title.toString());
    TextEditingController contentCtrl =
        TextEditingController(text: task.content.toString());
    print(task.title);
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskList"),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Titulo"),
              onChanged: (value) => {print(value)},
              onTap: () => {print("clicou")}),
          TextFormField(
            controller: contentCtrl,
            decoration: const InputDecoration(labelText: "Descreva a tarefa"),
          ),
          ElevatedButton(
              onPressed: () {
                task.title = titleCtrl.text;
                task.content = contentCtrl.text;
                Navigator.of(context).pop(task);
              },
              child: Text("Alterar")),
        ]),
      ),
    );
  }
}
