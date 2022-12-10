import 'package:flutter/foundation.dart';
import 'package:state_management_flutter_app/tasks/task.dart';
class Taskdata extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'name', isdone: false),
    Task(name: 'name1', isdone: false),
    Task(name: 'name2', isdone: false),
  ];
  int get taskcount{
    return tasks.length;
  }
  void deletetask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

  void addtask(String newtasktitle){
    final task = Task(name: newtasktitle);
    tasks.add(task);
    notifyListeners();
  }
  void updatetask(Task task){
    task.toggledone();
    notifyListeners();
  }
}