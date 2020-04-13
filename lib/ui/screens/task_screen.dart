import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_done/task/bloc/tasks_bloc.dart';
import 'package:get_it_done/task/bloc/tasks_state.dart';
import 'package:get_it_done/task/task_model.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
        builder: (BuildContext context, TasksState state) {
      if (state is TasksLoading) {
        return CircularProgressIndicator();
      }

      if (state is TasksLoadedSuccessfully) {
        final tasks = state.tasks;
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final Task task = tasks[index];
              return Text(task.name);
            });
      }

      return Container(child: Text(state.toString()));
    });
  }
}
