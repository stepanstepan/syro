import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/screen.dart';
import 'package:sequencer/bloc/module/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ModuleBloc _moduleBloc = ModuleBloc();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider<ModuleBloc>(
        bloc: _moduleBloc,
        child: Screen(),
      )
    );
  }

  @override
  void dispose() {
    _moduleBloc.dispose();
    super.dispose();
  }
}
