import 'package:flutter/material.dart';
import 'package:todos/database/model.dart';
import 'package:todos/ui/task_card.dart';

import '../ui/account_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? selectedDate;
  GlobalKey<FormState> form = GlobalKey();
  TextEditingController titleController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool value = false;

  Todo dummyTodo = Todo(
      id: 1,
      title: 'Dummy Todo',
      description: 'This is a dummy todo',
      date: DateTime.now().toString(),
      priority: 1);

  List<Todo> todos = [
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1),
    Todo(
        id: 1,
        title: 'Dummy Todo',
        description: 'This is a dummy todo',
        date: DateTime.now().toString(),
        priority: 1)
  ];

  void selectDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2024),
    );
    if (date != null && date != selectedDate) {
      setState(() {
        _date.text = date.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AccountCard(email: "reecejames934@gmail.com", name: "Njoroge"),
          const Text('My Tasks'),
          SwitchListTile(
            value: value,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
            title: const Text('Show Completed'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TaskCard(todo: todos[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('New Todo'),
                content: Form(
                    key: form,
                    child: Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a title';
                                }
                                return null;
                              },
                              controller: titleController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Task Title'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a priority';
                                }
                                return null;
                              },
                              controller: descriptionController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Description'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.date_range),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a date';
                                      }
                                      return null;
                                    },
                                    onTap: () => selectDate(),
                                    controller: _date,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Date'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                  IconButton(
                      onPressed: () {
                        //TODO save todo to database
                        if (form.currentState!.validate()) {
                          Todo todo = Todo(
                              id: 1,
                              title: titleController.text,
                              description: descriptionController.text,
                              date: _date.text,
                              priority: 1);

                          setState(() {
                            todos.add(todo);
                          });

                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon((Icons.save)))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
