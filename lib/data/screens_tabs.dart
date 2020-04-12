import 'package:flutter/material.dart';

import 'package:get_it_done/data/app_text.dart';

enum Tabs {
  stats,
  todos,
}

const Tabs initialScreen = Tabs.todos;

class TabDetails {
  final Icon icon;
  final Tabs tab;

  TabDetails(this.icon, { this.tab });
}

final List<TabDetails> tabDetails = <TabDetails>[
  TabDetails(
    Icon(Icons.list, semanticLabel: AppText.todosScreen,),
    tab: Tabs.todos
  ),
  TabDetails(
    Icon(Icons.show_chart, semanticLabel: AppText.statsScreen,),
    tab: Tabs.stats
  ),
];