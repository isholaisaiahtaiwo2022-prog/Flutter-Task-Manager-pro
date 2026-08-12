import 'package:flutter/material.dart';

class Task {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Task({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
