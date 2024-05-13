class CounterState {}

class InitialState extends CounterState {}

class UpdateState extends CounterState {
  final int counter;

  UpdateState(this.counter);
}
