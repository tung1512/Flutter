import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task list app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(),
    );
  }
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  //List to hold tasks
  List<Task> _tasks = [];

  //method to handle adding new tasks
  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(name: taskName));
    });
  }

//method to toggle done task
  void _toggleTaskDone(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
  }

//method to show dialog when add task
  void _showAddTaskDialog() {
    TextEditingController taskController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add new task'),
            content: TextField(
              controller: taskController,
              decoration: const InputDecoration(hintText: 'Enter task name'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    String taskName = taskController.text.trim();
                    if (taskName.isNotEmpty) {
                      _addTask(taskName);
                    }
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Task list')),
        body: _tasks.isEmpty
            ? const Center(child: Text('No tasks'))
            : ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: _tasks[index].isDone,
                      onChanged: (value) {
                        _toggleTaskDone(index);
                      },
                    ),
                    title: Text(
                      _tasks[index].name,
                      style: TextStyle(
                        decoration: _tasks[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  );
                }),
                floatingActionButton: FloatingActionButton(
                  onPressed: _showAddTaskDialog,
                tooltip: 'Add task',
                child: const Icon(Icons.add),),
                );
  }
}

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});
}
