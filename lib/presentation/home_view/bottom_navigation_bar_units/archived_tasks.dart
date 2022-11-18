import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  _ArchivedTasksState createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Archived Tasks',style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 25, color: Colors.black)),
    );
  }
}
