import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Model/tasksData.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';


class TasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          shape: CircleBorder(),
          onPressed: () {
            // Floating Action required Function
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) => SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Consumer<TasksData>(
                            builder: (context, tasksdata, child) {
                          return AddTaskScreen();
                        }))));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, bottom: 30, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                
                   Text(
                    '${Provider.of<TasksData>(context).tasksCount} Tasks',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )
                
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Consumer<TasksData>(
                  builder: (context, tasksdata, child) {
                    return TasksList(
                      
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
