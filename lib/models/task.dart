var _id = 0;

class Task {
  int? id;
  String title;
  String content;
  late bool isDone;

  Task({this.id, required this.title, required this.content}) {
    isDone = false;
    id = _id++;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Task: {id: $id, title: $title, content: $content, isDone: $isDone}';
  }
}

void main() {
  int initialCoins = 10;
  List<Task> tasks = [];
  for (int i = 0; i < 13; i++) {
    if (initialCoins > 0) {
      int value = initialCoins;
      tasks.add(Task(
          title: "Tarefa $initialCoins",
          content: "A tarefa é de número $value"));
      initialCoins--;
    } else {
      print("Acabaram as moedas\n");
    }
  }
  for (int i = 0; i < tasks.length; i++) {
    print(tasks[i]);
  }
}
