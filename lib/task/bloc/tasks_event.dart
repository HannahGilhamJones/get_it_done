import 'package:equatable/equatable.dart';

import 'package:get_it_done/task/task_model.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class TasksUpdated extends TasksEvent {
  final List<Task> tasks;

  TasksUpdated(this.tasks) {
    tasks.add(Task("Example One"));
  }

  @override
  List<Object> get props => [tasks];

  @override
  String toString() => 'TasksUpdated { tasks: $tasks }';
}

class TaskAdded extends TasksEvent {
  final Task newTask;

  const TaskAdded(this.newTask);

  @override
  List<Object> get props => [newTask];

  @override
  String toString() => 'TaskAdded { task: $newTask }';
}

class TaskUpdated extends TasksEvent {
  final Task updatedTask;

  const TaskUpdated(this.updatedTask);

  @override
  List<Object> get props => [updatedTask];

  @override
  String toString() => 'TaskUpdated { task: $updatedTask }';
}

class TaskDeleted extends TasksEvent {
  final Task deletedTask;

  const TaskDeleted(this.deletedTask);

  @override
  List<Object> get props => [deletedTask];

  @override
  String toString() => 'TaskDeleted { task: $deletedTask }';
}

class ClearCompleted extends TasksEvent {}
