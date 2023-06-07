import 'package:flutter/material.dart';
import 'package:lista_tarefas/models/task.dart';
import 'package:lista_tarefas/screens/task_create_page.dart';
import 'package:lista_tarefas/screens/task_edit_page.dart';

// TODO: Change to statefulwidget
class TaskList extends StatefulWidget {
  TaskList({super.key});

  TextEditingController texteditor = TextEditingController();
  int coins = 10;
  List<Task> tasks = [Task(title: "ASDAd", content: "asdasd")];

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskList"),
        actions: [
          IconButton(
              onPressed: () async {
                if (!haveCoins(widget.coins)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "You don't have enough coins! Complete some tasks."),
                  ));
                } else {
                  Task newTask = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateTask()));

                  setState(() {
                    widget.tasks.add(newTask);
                    widget.coins--;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("New task added ! Coins: ${widget.coins}")));
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Coins: ${widget.coins}"),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: widget.tasks.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(widget.tasks[index].title),
                        IconButton(
                            onPressed: () async {
                              Task editedTask = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TaskEdit(task: widget.tasks[index])));
                              setState(() {
                                widget.tasks[index] = editedTask;
                              });
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.tasks.remove(widget.tasks[index]);
                                widget.coins++;
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Task deleted. Coins: ${widget.coins}")));
                              });
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool haveCoins(int coins) {
  if (coins > 0) {
    return true;
  } else {
    return false;
  }
}
