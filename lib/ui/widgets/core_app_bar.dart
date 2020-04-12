import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/bloc/tab/tab_bloc.dart';
import 'package:get_it_done/bloc/tab/tab_event.dart';

import 'package:get_it_done/data/screens_tabs.dart' as Screens;

class CoreAppBar extends StatelessWidget {
  final Screens.Tabs activeTab;

  CoreAppBar(this.activeTab, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _iconButtons(context, activeTab),
      ),
      shape: const CircularNotchedRectangle(),
    );
  }

  IconButton _iconButton(BuildContext context, Screens.Tabs activeTab, Screens.TabDetails tabDetail) {
    return IconButton(
      icon: tabDetail.icon,
      color: activeTab == tabDetail.tab
        ? Theme.of(context).indicatorColor
        : Theme.of(context).iconTheme.color,
      onPressed: () => {
        BlocProvider.of<TabBloc>(context).add(TabUpdated(tabDetail.tab))
      }
    );
  }

  List<Widget> _iconButtons(BuildContext context, Screens.Tabs activeTab) {
    List<Widget> list = <Widget>[];
    Screens.tabDetails.forEach((Screens.TabDetails tabDetail) {
      list.add(_iconButton(context, activeTab, tabDetail));
    });
    return list;
  }
}