import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/bloc/counter_bloc.dart';
import 'package:sequencer/bloc/counter_events.dart';

class Sequencer8 extends StatelessWidget {

  Offset position;
  Sequencer8({@required this.position});

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<CounterEvent, List<Offset>>(
      bloc: _counterBloc,
      builder: (BuildContext context, List<Offset> count) {
        return Base(
          width: 500,
          height: 250,
          position: count[0],
          name: 'Sequencer 8',
          inputs: ['clock in'],
          outputs: ['cv out', 'gate out'],
          child: BlocBuilder<CounterEvent, List<Offset>>(
            bloc: _counterBloc,
            builder: (BuildContext context, List<Offset> count) {
              return Column(
                children: <Widget>[
                  Container(
                    child: Text('$count'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        _counterBloc.dispatch(CounterEvent.increment);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.remove),
                      onPressed: () {
                        _counterBloc.dispatch(CounterEvent.decrement);
                      },
                    ),
                  ),
                ],
              );
            }
          )
        );
      }
    );

    // return BlocBuilder<CounterEvent, int>(
    //   bloc: _counterBloc,
    //   builder: (BuildContext context, int count) {
    //     return Base(
    //       width: 500,
    //       height: 400,
    //       position: position,
    //       name: 'Sequencer 8',
    //       inputs: ['clock in'],
    //       outputs: ['cv out', 'gate out'],
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             child: Text('$count'),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(vertical: 5.0),
    //             child: FloatingActionButton(
    //               child: Icon(Icons.add),
    //               onPressed: () {
    //                 _counterBloc.dispatch(CounterEvent.increment);
    //               },
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(vertical: 5.0),
    //             child: FloatingActionButton(
    //               child: Icon(Icons.remove),
    //               onPressed: () {
    //                 _counterBloc.dispatch(CounterEvent.decrement);
    //               },
    //             ),
    //           ),
    //         ],
    //       )
    //     );
    //   },
    // );

    // return Base(
    //   width: 400,
    //   height: 200,
    //   position: position,
    //   name: 'Sequencer 8',
    //   inputs: ['clock in'],
    //   outputs: ['cv out', 'gate out'],
    //   child: Container(
    //     child: Text('Sequencer will placed here'),
    //   )
    // );
  }

}

