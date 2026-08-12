import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_manager/Model/Task.dart';

class ApiService {
  Future<Task> getTask() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
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


    Future<Task> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
