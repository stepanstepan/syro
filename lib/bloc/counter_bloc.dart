import 'package:flutter/gestures.dart';
import './counter_events.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, Offset> {
  @override
  Offset get initialState => new Offset(100, 150);

  @override
  Stream<Offset> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        print('CATCHED decrement');
        yield currentState - new Offset(10, 10);
        break;
      case CounterEvent.increment:
        print('CATCHED increment');
        yield currentState + new Offset(10, 10);
        break;
    }
  }
}