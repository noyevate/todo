import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/feature/home/presentation/pages/home.dart';
import 'package:todo/feature/home/presentation/widgets/fa_b.dart';
import 'package:todo/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo/feature/task/presentation/bloc/task_event.dart';
import 'package:todo/feature/task/presentation/bloc/task_state.dart';
import 'package:todo/feature/task/domain/entities/task.dart';

import '../../task/data/repository/fake_repository.dart';

void main() {
  testWidgets('add task through UI and display in list', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TaskBloc>(
            create: (_) => TaskBloc(FakeRepository())..add(LoadTasks()),
          ),
        ],
        child: const Scaffold(
          body: HomeView(),
          floatingActionButton: FaB(), // your custom FAB
        ),
      ),
    ),
  );

  // Tap the FAB
  final fabFinder = find.byKey(const Key('123'));
  expect(fabFinder, findsOneWidget);
  await tester.tap(fabFinder);
  await tester.pumpAndSettle();

  // Enter task details
  await tester.enterText(find.byKey(const Key('titleField')), 'Test Task');
  await tester.enterText(find.byKey(const Key('subtitleField')), 'Test Description');

  // Submit
  await tester.tap(find.byKey(const Key('submitButton')));
  await tester.pumpAndSettle();

  // Check if the new task appears
  expect(find.text('Test Task'), findsOneWidget);
});

}
