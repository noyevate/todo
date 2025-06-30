// import 'package:equatable/equatable.dart';
// import 'package:todo/feature/task/domain/entities/task.dart';

// class TaskState extends Equatable {
//   final List<Task> tasks;

//   const TaskState({required this.tasks});

//   @override
//   List<Object?> get props => [tasks];

//   TaskState copyWith({List<Task>? tasks}) {
//     return TaskState(tasks: tasks ?? this.tasks);
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:todo/feature/task/domain/entities/task.dart';

enum TaskFilter { all, active, completed }

class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskFilter filter;

  const TaskState({
    required this.tasks,
    this.filter = TaskFilter.all,
  });

  List<Task> get filteredTasks {
    switch (filter) {
      case TaskFilter.active:
        return tasks.where((task) => !task.isCompleted).toList();
      case TaskFilter.completed:
        return tasks.where((task) => task.isCompleted).toList();
      case TaskFilter.all:
      default:
        return tasks;
    }
  }

  @override
  List<Object?> get props => [tasks, filter];

  TaskState copyWith({
    List<Task>? tasks,
    TaskFilter? filter,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      filter: filter ?? this.filter,
    );
  }
}
