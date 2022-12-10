import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_flutter_app/tasks/task.dart';
import 'package:state_management_flutter_app/tasks/task_data.dart';

class task_tile extends StatefulWidget {
  final List<Task> tasks;
  task_tile(this.tasks);
  @override
  State<task_tile> createState() => _task_tileState();
}

class _task_tileState extends State<task_tile> {


  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(
      builder: (context , taskdata , child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Task_sub_tiles(
              isChecked: taskdata.tasks[index].isdone,
              tasktile: taskdata.tasks[index].name,
              checkboxCallback: (checkstate) {
                taskdata.updatetask(taskdata.tasks[index]);
              },
              longpresscallback: (){
                taskdata.deletetask(taskdata.tasks[index]);
              },
            );
          },
          itemCount: widget.tasks.length,
        );
      }
    );
  }
}

class Task_sub_tiles extends StatelessWidget {
  final bool isChecked;
  final String tasktile;
  final  checkboxCallback;
  final longpresscallback;

  Task_sub_tiles({required this.isChecked, required this.tasktile ,required this.checkboxCallback , required this.longpresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpresscallback,
      title: Text(
        '$tasktile' ,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}
// Taskcheckbox(isChecked , checkboxCallback),
// void checkboxCallback ( newValue){
//   setState(() {
//     isChecked = newValue;
//   });
// }
