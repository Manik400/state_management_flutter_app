import 'package:state_management_flutter_app/tasks/task.dart';
import 'package:state_management_flutter_app/tasks/task_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Addtaskscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newtasktitle;

    // late String newtask ;
    return Container(
      // padding: EdgeInsets.all(20.0),
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newtask){
                newtasktitle = newtask;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Provider.of<Taskdata>(context , listen: false).addtask(newtasktitle);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.cyan)),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
