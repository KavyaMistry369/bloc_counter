// Business Logic Of Counter App

import 'package:bloc_counter/events/counter_event.dart';
import 'package:bloc_counter/states/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<IncrementEvent>(increment);
    on<DecrementEvent>(decrement);
  }

  increment(IncrementEvent event, Emitter<CounterState> emitter) async {
    counter++;
    emitter(UpdateState(counter));
  }

  decrement(DecrementEvent event, Emitter<CounterState> emitter) async {
    counter--;
    emitter(UpdateState(counter));
  }
}
