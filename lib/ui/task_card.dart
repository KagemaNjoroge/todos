import 'package:flutter/material.dart';
import 'package:todos/database/model.dart';

class TaskCard extends StatefulWidget {
  Todo todo;
  TaskCard({super.key, required this.todo});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title),
      subtitle: Text(widget.todo.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    );
  }
}
