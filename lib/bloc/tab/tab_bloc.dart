import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/bloc/tab/tab_event.dart';

import 'package:get_it_done/data/screens_tabs.dart' as Screens;

class TabBloc extends Bloc<TabEvent, Screens.Tabs> {
  @override
  Screens.Tabs get initialState => Screens.initialScreen;

  @override
  Stream<Screens.Tabs> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}
