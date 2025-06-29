import 'package:equatable/equatable.dart';
import 'package:todo/feature/task/domain/entities/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({required this.tasks});

  @override
  List<Object?> get props => [tasks];

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }
}