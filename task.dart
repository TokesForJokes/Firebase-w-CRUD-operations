import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String name;
  final bool isCompleted;
  final String priority;
  final DateTime dueDate;

  Task({
    required this.id,
    required this.name,
    this.isCompleted = false,
    this.priority = 'Low',
    required this.dueDate,
  });

  // Convert a Task object to a map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isCompleted': isCompleted,
      'priority': priority,
      'dueDate': Timestamp.fromDate(dueDate),
    };
  }

  // Create a Task object from a map retrieved from Firestore
  factory Task.fromMap(String id, Map<String, dynamic> map) {
    return Task(
      id: id,
      name: map['name'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      priority: map['priority'] ?? 'Low',
      dueDate: (map['dueDate'] as Timestamp).toDate(),
    );
  }
}
