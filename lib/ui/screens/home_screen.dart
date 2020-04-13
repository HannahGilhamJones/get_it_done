import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/bloc/tab/tab_bloc.dart';

import 'package:get_it_done/config/routes.dart';

import 'package:get_it_done/data/app_text.dart';
import 'package:get_it_done/data/screens_tabs.dart' as Screens;

import 'package:get_it_done/ui/screens/stats_screen.dart';
import 'package:get_it_done/ui/screens/task_screen.dart';

import 'package:get_it_done/ui/widgets/core_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, Screens.Tabs>(
        builder: (BuildContext context, Screens.Tabs activeTab) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppText.appName),
          ),
          body: activeTab == Screens.Tabs.todos ? TaskScreen() : StatsScreen(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Routes.addTodo),
              tooltip: AppText.addTodo,
              child: const Icon(Icons.add),
              elevation: 2.0),
          bottomNavigationBar: CoreAppBar(activeTab),
        ),
      );
    });
  }
}
