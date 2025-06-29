import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/feature/task/domain/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc(this.repository) : super(const TaskState(tasks: [])) {
    on<LoadTasks>((event, emit) async {
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<AddTask>((event, emit) async {
      final task = await repository.addTask(event.task);
    //  print(task);
      final tasks = await repository.getTasks();
      print("${tasks.length}");
      emit(state.copyWith(tasks: tasks));
    });

    on<DeleteTask>((event, emit) async {
      await repository.deleteTask(event.taskId);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<ToggleTaskCompletion>((event, emit) async {
      await repository.toggleTaskCompletion(event.task);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });
  }
}