import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/screen.dart';
import 'package:sequencer/bloc/module/index.dart';
import 'package:sequencer/bloc/cable/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ModuleBloc _moduleBloc = ModuleBloc();
  final CableBloc _cableBloc = CableBloc();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProviderTree(
        blocProviders: [
          BlocProvider<ModuleBloc>(bloc: _moduleBloc),
          BlocProvider<CableBloc>(bloc: _cableBloc),
        ],
        child: Screen()
      )
    );
  }

  @override
  void dispose() {
    _moduleBloc.dispose();
    _cableBloc.dispose();
    super.dispose();
  }
}
