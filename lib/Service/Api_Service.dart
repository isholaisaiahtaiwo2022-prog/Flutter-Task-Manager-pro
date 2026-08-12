import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_manager/Model/Task.dart';

class ApiService {
  Future<Task> getTask() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      headers: {
        'Accept': 'application/json'
      },
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return Task.fromJson(jsonData);
    } else {
      throw Exception(
        'Failed to load task. Status Code: ${response.statusCode}',
      );
    }
  }
}
