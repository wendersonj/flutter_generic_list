import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:lista_tarefas/screens/task_create_page.dart';
import 'package:lista_tarefas/screens/task_edit_page.dart';

// TODO: Change to statefulwidget
class TaskList extends StatelessWidget {
  TaskList({super.key});
  List<Task> tasks = [];

  TextEditingController texteditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int coins = 10;
    List<Task> tasks = [Task(title: "ASDAd", content: "asdasd")];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "$coins",
                style: const TextStyle(fontSize: 18),
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
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
                    return Row(
                      children: [
                        Text(tasks[index].title),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskEdit()));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    );
                  },
                ),
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
