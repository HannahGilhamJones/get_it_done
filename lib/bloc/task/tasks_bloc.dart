import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_done/mapper/task_mapper.dart';

import 'package:get_it_done/model/task.dart';

import 'package:meta/meta.dart';

import 'package:get_it_done/bloc/task/tasks_event.dart' as Event;
import 'package:get_it_done/bloc/task/tasks_state.dart' as State;
import 'package:get_it_done/repository/task_repository.dart';

class TasksBloc extends Bloc<Event.TasksEvent, State.TasksState> {
  final TaskRepository taskRepository;

  TasksBloc({@required this.taskRepository});

  @override
  State.TasksState get initialState => State.TasksLoading();

  @override
  Stream<State.TasksState> mapEventToState(Event.TasksEvent event) async* {
    if (event is Event.LoadTasks) {
      yield* _mapLoadTasksToState();
      return;
    }

    if (event is Event.TasksUpdated) {
      yield* _mapTasksUpdatedToState(event.tasks);
      return;
    }

    if (event is Event.TaskAdded) {
      yield* _mapTaskAddedToState(event.newTask);
      return;
    }

    if (event is Event.TaskUpdated) {
      yield* _mapTaskUpdatedToState(event.updatedTask);
      return;
    }

    if (event is Event.TaskDeleted) {
      yield* _mapTaskDeletedToState(event.deletedTask);
      return;
    }

    yield* _mapTasksLoadedFailureToState();
    return;
  }

  Stream<State.TasksState> _mapLoadTasksToState() async* {
    List<Task> tasks =
        TaskMapper.mapTasksFromEntities(await taskRepository.tasks());

    yield State.TasksLoadedSuccessfully(tasks);
  }

  Stream<State.TasksState> _mapTasksUpdatedToState(List<Task> tasks) async* {
    yield State.TasksLoadedSuccessfully(tasks);
  }

  Stream<State.TasksState> _mapTaskAddedToState(Task newTask) async* {
    if (state is State.TasksLoadedSuccessfully) {
      taskRepository.addNewTask(newTask.toEntity());
    }
  }

  Stream<State.TasksState> _mapTaskUpdatedToState(Task updatedTask) async* {
    if (state is State.TasksLoadedSuccessfully) {
      taskRepository.updateTask(updatedTask.toEntity());
    }
  }

  Stream<State.TasksState> _mapTaskDeletedToState(Task deletedTask) async* {
    if (state is State.TasksLoadedSuccessfully) {
      taskRepository.deleteTask(deletedTask.toEntity());
    }
  }

  Stream<State.TasksState> _mapTasksLoadedFailureToState() async* {
    yield State.TasksLoadedFailure();
  }
}
