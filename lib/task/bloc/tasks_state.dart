import 'package:equatable/equatable.dart';

import 'package:get_it_done/task/task_model.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {}

class TasksLoadedSuccessfully extends TasksState {
  final List<Task> tasks;

  const TasksLoadedSuccessfully([this.tasks = const []]);

  @override
  List<Object> get props => [tasks];

  @override
  String toString() => 'TasksLoadedSuccessfully { tasks: $tasks }';
}

class TasksLoadedFailure extends TasksState {}
