import 'package:hive/hive.dart';
import 'package:todo/feature/task/domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import '../models/task_model.dart';

class HiveTaskRepositoryImpl implements TaskRepository {
  final Box<TaskModel> taskBox = Hive.box<TaskModel>('tasks');

  @override
  Future<void> addTask(Task task) async {
    await taskBox.put(task.id, TaskModel.fromEntity(task));
    
  }

  @override
  Future<List<Task>> getTasks() async {
    return taskBox.values.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await taskBox.delete(taskId);
  }

  @override
  Future<void> toggleTaskCompletion(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await taskBox.put(updatedTask.id, TaskModel.fromEntity(updatedTask));
  }
}
