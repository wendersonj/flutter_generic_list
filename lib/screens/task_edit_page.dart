import 'package:flutter/material.dart';

class TaskEdit extends StatelessWidget {
  TaskEdit({super.key, this.valor});

  String? valor;

  @override
  Widget build(BuildContext context) {
    int coins = 10;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("TaskList"),
              Padding(padding: EdgeInsets.all(80), child: Text("$coins"))
            ],
          ),
        ),
        body: Center(child: Text("Edit")));
  }
}
