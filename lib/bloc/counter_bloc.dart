import './counter_events.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        print('CATCHED decrement');
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        print('CATCHED increment');
        yield currentState + 1;
        break;
    }
  }
}