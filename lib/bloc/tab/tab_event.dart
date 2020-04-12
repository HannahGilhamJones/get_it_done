import 'package:equatable/equatable.dart';

import 'package:get_it_done/data/screens_tabs.dart' as Screens;

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabUpdated extends TabEvent {
  final Screens.Tabs tab;

  const TabUpdated(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'TabUpdated { tab: $tab }';
}
