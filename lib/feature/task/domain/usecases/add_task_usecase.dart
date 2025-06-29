import 'package:todo/feature/task/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class AddTaskUseCase {
  final TaskRepository repository;
  AddTaskUseCase(this.repository);

  Future<void> call(Task task) => repository.addTask(task);
}
