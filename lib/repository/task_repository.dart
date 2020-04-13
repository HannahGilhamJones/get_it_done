import 'dart:async';

import 'package:get_it_done/entity/task.dart';

abstract class TaskRepository {
  Future<void> addNewTask(TaskEntity task);

  Future<void> updateTask(TaskEntity task);

  Future<void> deleteTask(TaskEntity task);

  Future<List<TaskEntity>> tasks();
}

class LocalStorage implements TaskRepository {
  final List<TaskEntity> _tasks = List<TaskEntity>();

  // Remove - this is for testing purposes
  LocalStorage() {
    _tasks.add(TaskEntity("Example One", "Test", false, "1"));
    _tasks.add(TaskEntity("Example Two", "Test", true, "2"));
    _tasks.add(TaskEntity("Example Three", "Test", false, "3"));
  }

  @override
  Future<void> addNewTask(TaskEntity task) {
    return Future(() {
      return _tasks.add(task);
    });
  }

  @override
  Future<void> updateTask(TaskEntity task) {
    return Future(() {
      int replaceIndex = _tasks.indexOf(task);
      if (replaceIndex > -1) {
        return _tasks[replaceIndex] = task;
      }
      return false;
    });
  }

  @override
  Future<void> deleteTask(TaskEntity task) {
    return Future(() {
      return _tasks.remove(task);
    });
  }

  @override
  Future<List<TaskEntity>> tasks() {
    return Future(() {
      return _tasks;
    });
  }
}

final LocalStorage localStorage = LocalStorage();
