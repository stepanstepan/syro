import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen.dart';
import 'package:sequencer/models/module.dart';
import 'blocs/modules/modules_bloc.dart';
import 'blocs/modules/modules_event.dart';
import 'blocs/modules/modules_state.dart';



void main() => runApp(MyApp());

// final List<Map<String, double>> modules = [
//   {"x": 100, "y": 200},
//   {"x": 300, "y": 400},
// ];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ModulesBloc _modulesBloc = ModulesBloc();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider<ModulesBloc>(
        bloc: _modulesBloc,
        child: Screen()
      ),
    );
  }

  @override
  void dispose() {
    _modulesBloc.dispose();
    super.dispose();
  }
}

// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Screen()
//     );
//   }

// }

