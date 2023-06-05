import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:lista_tarefas/screens/task_create_page.dart';
import 'package:lista_tarefas/screens/task_edit_page.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});
  List<Task> tasks = [];

  TextEditingController texteditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int coins = 10;
    List<Task> tasks = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "$coins",
                style: const TextStyle(fontSize: 18),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListView(
                        children: [ListTile(title: Text(tasks[index].title))]);
                  },
                ),
              ),
              const Text("Ok"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskEdit()),
                  );
                },
                child: const Padding(
                    padding: EdgeInsets.all(80), child: Text("Clique")),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  Task newTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateTask(),
                      ));
                  print("Voltou !");
                  print(newTask);
                  tasks.add(newTask);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        // CheckboxListTile(value: value, onChanged: onChanged),
      ]),
    );
  }
}
