import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:lista_tarefas/screens/task_list_page.dart';

class CreateTask extends StatelessWidget {
  CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey();
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController contentCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: "Titulo"),
                  onChanged: (value) => {print(value)},
                  onTap: () => {print("clicou")}),
              TextFormField(
                controller: contentCtrl,
                decoration:
                    const InputDecoration(labelText: "Descreva a tarefa"),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print(titleCtrl.text);
                      print("saved");
                      Task newTask = Task(
                          title: titleCtrl.text.toString(),
                          content: contentCtrl.text.toString());
                      print(newTask);
                      Navigator.of(context).pop(newTask);
                    },
                    child: const Text("Salvar"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      titleCtrl.clear();
                      contentCtrl.clear();
                      print("cleared");
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
