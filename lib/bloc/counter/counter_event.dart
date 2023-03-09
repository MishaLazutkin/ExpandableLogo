part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {
  final Item item;
  CounterIncrementEvent(  this.item);
}

class CounterDecrementEvent extends CounterEvent {
}

class CounterInitialEvent extends CounterEvent{
}
