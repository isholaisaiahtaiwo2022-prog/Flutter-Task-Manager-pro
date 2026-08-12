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


    // 3. PUT: Replace an existing post completely
  Future<Task> updatePost(int id, String title, String body) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'id': id,
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  // 4. DELETE: Remove a post by ID
  Future<bool> deletePost(int id) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
