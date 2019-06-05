import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen.dart';
import 'package:sequencer/bloc/counter_bloc.dart';
import 'package:sequencer/bloc/counter_events.dart';

import 'modules/sequencer8.dart';

void main() => runApp(MyApp());

// final List<Map<String, double>> modules = [
//   {"x": 100, "y": 200},
//   {"x": 300, "y": 400},
// ];

// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Screen()
//     );
//   }

// }


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider<CounterBloc>(
        bloc: _counterBloc,
        // child: Sequencer8(position: new Offset(100, 200)),
        child: Screen(),
      )
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
