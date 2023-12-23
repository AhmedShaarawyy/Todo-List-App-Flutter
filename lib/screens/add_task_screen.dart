import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Model/tasksData.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.only(top: 150, bottom: 150, left: 50, right: 50),
      child: Column(
        children: [
          Text('Add Task',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w500)),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              print(newTaskTitle);
              newTaskTitle = newText;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<TasksData>(
            builder: (context, tasksdata, child) {
              return MaterialButton(
                minWidth: 360,
                height: 60,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  tasksdata.add(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
