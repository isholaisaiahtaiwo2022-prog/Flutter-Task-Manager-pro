import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_manager/Model/Task.dart';

class ApiService {
  Future<Task> getTask() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    print(response.statusCode);
    final jsonData = jsonDecode(response.body);
    final task = Task.fronJson(jsonData);
    print(task.title);

    return task;
  }
}
