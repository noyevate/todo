import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/utils/themes.dart';
import 'package:todo/feature/choose_mode/presentation/bloc/theme_bloc.dart';
import 'package:todo/feature/choose_mode/presentation/bloc/theme_state.dart';
import 'package:todo/feature/choose_mode/presentation/pages/choose_theme.dart';
import 'package:todo/feature/task/data/models/task_model.dart';
import 'package:todo/feature/task/data/repository/hive_task_repository.dart';
import 'package:todo/feature/task/domain/entities/task.dart';
import 'package:todo/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo/feature/task/presentation/bloc/task_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter()); // Use TaskModel here
  await Hive.openBox<TaskModel>('tasks');

  // Setup repository
  final taskRepository = HiveTaskRepositoryImpl();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaskBloc(taskRepository)..add(LoadTasks()),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(720, 1640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'to do',
                debugShowCheckedModeBanner: false,
                theme: state.themeData,
                home: ChooseModePage(),
              );
            },
          );
        });
  }
}
