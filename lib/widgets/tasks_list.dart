import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Model/tasksData.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksdata, child) {
        return ListView.builder(
          
          itemCount: tasksdata.tasksCount,
          itemBuilder: (context, i) {
            final task = tasksdata.tasks[i];
            return TasksTile(
              
              
                name: task.name,
                isChecked: task.isDone,
                checkBoxCallback: (checkBoxState) {
                  tasksdata.updateTask(task);
                },
                LongPressCallback: () {
                  tasksdata.deleteTask(task);
                },
                );
          },
        );
      },
    );
  }
}
