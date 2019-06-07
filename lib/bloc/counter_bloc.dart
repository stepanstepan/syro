import 'package:flutter/gestures.dart';
import './counter_events.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, List<Offset>> {
  @override
  List<Offset> get initialState => [new Offset(100, 150)];

  @override
  Stream<List<Offset>> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        print('CATCHED decrement');
        currentState[0] -= new Offset(10, 10);
        print(currentState);
        yield []..addAll(currentState);
        // yield List(currentState[0])
        break;
      case CounterEvent.increment:
        print('CATCHED increment');
        currentState[0] += new Offset(10, 10);
        // yield currentState;
        yield []..addAll(currentState);
        break;
    }
  }
}