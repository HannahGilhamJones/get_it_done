import 'package:equatable/equatable.dart';
import 'package:get_it_done/entity/task.dart';

import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String name;
  final String description;
  final bool complete;
  final String id;

  Task(
    this.name, {
    String description = '',
    this.complete = false,
    String id,
  })  : this.description = description ?? '',
        this.id = id ?? Uuid().v4();

  Task copyWith({String id, String name, String description, bool complete}) {
    return Task(name ?? this.name,
        description: description ?? this.description,
        complete: complete ?? this.complete,
        id: id ?? this.id);
  }

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() {
    return 'Task { name: $name, description: $description, complete: $complete, id: $id }';
  }

  TaskEntity toEntity() {
    return TaskEntity(name, description, complete, id);
  }

  static Task fromEntity(TaskEntity entity) {
    return Task(
      entity.name,
      description: entity.description,
      complete: entity.complete ?? false,
      id: entity.id ?? Uuid().v4(),
    );
  }
}
