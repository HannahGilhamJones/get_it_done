import 'package:get_it_done/task/task_entity.dart';
import 'package:get_it_done/task/task_model.dart';

class TaskMapper {
  static List<Task> mapTasksFromEntities(List<TaskEntity> taskEntities) {
    List<Task> _convertedTasks = List<Task>();
    taskEntities.forEach((element) {
      _convertedTasks.add(Task.fromEntity(element));
    });
    return _convertedTasks;
  }
}
