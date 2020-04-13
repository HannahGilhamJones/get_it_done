class TaskEntity {
  final String name;
  final String description;
  final bool complete;
  final String id;

  TaskEntity(this.name, this.description, this.complete, this.id);

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ complete.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          complete == other.complete &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      'name': name,
      'description': description,
      'complete': complete,
      'id': id,
    };
  }

  static TaskEntity fromJson(Map<String, Object> json) {
    return TaskEntity(json['name'] as String, json['description'] as String,
        json['complete'] as bool, json['id'] as String);
  }

  @override
  String toString() {
    return 'TaskEntity { name: $name, description: $description, complete: $complete, id: $id }';
  }
}
