import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  late List<String> tasks;
  TextEditingController task = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "To Do App",
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: task,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter task',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (task.text != "") {
                                setState(() {
                                  tasks.add(task.text);
                                });
                                Navigator.pop(context);
                                task.clear();
                              }
                            },
                            child: Text("Save"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: (tasks.length == 0)
          ? Center(child: Text("No active tasks", style: TextStyle(fontSize: 20)))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    tasks[index],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
