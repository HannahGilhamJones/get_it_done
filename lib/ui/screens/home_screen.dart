import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/bloc/tab/tab_bloc.dart';
import 'package:get_it_done/bloc/tab/tab_event.dart';

import 'package:get_it_done/config/routes.dart';

import 'package:get_it_done/data/app_text.dart';
import 'package:get_it_done/data/screens_tabs.dart' as Screens;

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
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            color: activeTab == Screens.Tabs.todos ? Colors.blue : Colors.green,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Routes.addTodo),
              tooltip: AppText.addTodo,
              child: const Icon(Icons.add),
              elevation: 2.0),
          bottomNavigationBar: CoreAppBar(activeTab),
          // bottomNavigationBar: BottomAppBar(
          //   child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: _iconButtons(context, activeTab),
          //   ),
          //   shape: const CircularNotchedRectangle(),
          // ),
        ),
      );
    });
  }
}
