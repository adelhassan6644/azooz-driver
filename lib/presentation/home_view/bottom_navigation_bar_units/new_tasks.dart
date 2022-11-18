import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTasks extends StatefulWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  _NewTasksState createState() => _NewTasksState();

}

class _NewTasksState extends State<NewTasks> {
  @override
  Widget build(BuildContext context) {
    return  const Center(child: Text('New Tasks',style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25, color: Colors.black)));
  }
}
