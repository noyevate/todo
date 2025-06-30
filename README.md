# todo
a simple task management app Add, edit, delete, and mark tasks as complete/incomplete

# How to Run
1. Install Flutter & Dependencies
   Make sure Flutter is installed. Then:

   flutter pub get
2.  Generate Hive TypeAdapter
    Run build_runner to generate Hive files:

    flutter pub run build_runner build --delete-conflicting-outputs

3. Run App

   flutter run

# Architecture Summary
This app is built using the Clean Architecture pattern, which separates concerns across multiple layers:

Domain Layer: Contains core business logic, including Task entities and use cases (AddTaskUseCase, UpdateTaskUseCase).

Data Layer: Implements the repositories and interacts with the local database (Hive).

Presentation Layer: Handles UI and state using flutter_bloc. It listens to events (e.g., AddTask, DeleteTask) and renders state changes.

This structure improves maintainability, scalability, and testability by keeping each layer decoupled.


State Management
This app uses flutter_bloc for state management following the Bloc pattern. All user actions (adding, updating, filtering) are handled via Bloc events and states.
