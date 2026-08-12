import 'package:flutter/material.dart';
import 'package:task_manager/Service/Api_Service.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  final ApiService apiService = ApiService();

  String taskTitle = 'Loading...';
  bool completed = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTask();
  }

  Future<void> loadTask() async {
    final task = await apiService.getTask();

    setState(() {
      taskTitle = task.title;
      completed = task.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: Center(child: Text(taskTitle)),
    );
  }
}
