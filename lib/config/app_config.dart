import 'package:get_it_done/repository/task_repository.dart';

class AppConfig {
  static final String storage = 'localStorage';

  static TaskRepository repository() {
    if (storage == 'localStorage') {
      return localStorage;
    }

    return localStorage;
  }
}
