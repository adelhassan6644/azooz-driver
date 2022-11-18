import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Done Tasks',style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 25, color: Colors.black)),
    );
  }
}
