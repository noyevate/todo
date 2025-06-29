
import 'package:todo/feature/task/domain/entities/task.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String taskId;
  DeleteTask(this.taskId);
}

class ToggleTaskCompletion extends TaskEvent {
  final Task task;
  ToggleTaskCompletion(this.task);
}
