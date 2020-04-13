import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/tab/bloc/tab_bloc.dart';
import 'package:get_it_done/tab/bloc/tab_event.dart';

import 'package:get_it_done/tab/screens_tabs.dart';

import 'package:get_it_done/tab/tab_details.dart';

class CoreAppBar extends StatelessWidget {
  final Tabs activeTab;

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

  IconButton _iconButton(BuildContext context, Tabs activeTab,
      TabDetails tabDetail) {
    return IconButton(
        icon: tabDetail.icon,
        color: activeTab == tabDetail.tab
            ? Theme.of(context).indicatorColor
            : Theme.of(context).iconTheme.color,
        onPressed: () =>
            {BlocProvider.of<TabBloc>(context).add(TabUpdated(tabDetail.tab))});
  }

  List<Widget> _iconButtons(BuildContext context, Tabs activeTab) {
    List<Widget> list = <Widget>[];
      tabDetails.forEach((TabDetails tabDetail) {
      list.add(_iconButton(context, activeTab, tabDetail));
    });
    return list;
  }
}
