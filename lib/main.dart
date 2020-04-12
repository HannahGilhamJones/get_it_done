import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it_done/bloc/diagnostic_bloc_delegate.dart';
import 'package:get_it_done/bloc/tab/tab_bloc.dart';

import 'package:get_it_done/config/routes.dart';

import 'package:get_it_done/data/app_text.dart';

import 'package:get_it_done/ui/screens/home_screen.dart';

void main() {
  BlocSupervisor.delegate = DiagnosticBlocDelegate();

  runApp(GetItDone());
}

class GetItDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.appName,
      routes: {
        Routes.home: (BuildContext context) {
          return BlocProvider<TabBloc>(
            create: (BuildContext context) => TabBloc(),
            child: HomeScreen(),
          );
        }
      }
    );
  }
}