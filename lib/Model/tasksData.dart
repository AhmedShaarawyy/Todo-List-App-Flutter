import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/Model/task.dart';

class TasksData with ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(
      name: 'Play Football',
    ),
    Tasks(
      name: 'Play Basketball',
    ),
    Tasks(
      name: 'Play Rugby',
    ),
    Tasks(
      name: 'Play Tennis',
    ),
    Tasks(
      name: 'hangout',
    )
  ];

  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void add(String newTaskTitle) {
    final task = Tasks(name: newTaskTitle);
    _tasks.add(task);

    notifyListeners();
  }

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
