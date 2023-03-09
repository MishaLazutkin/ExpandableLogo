part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final List<Item> items ;
  late  Logo? logo;

    CounterState( {this.logo, required this.items});


  @override
  List<Object> get props => [items];


}

class CounterInitialState extends CounterState {
    CounterInitialState() : super( items: []);
}

class IncrementState extends CounterState {
    IncrementState( List<Item> increasedValue) : super( items: increasedValue);
}

class DecrementState extends CounterState {
    DecrementState(List<Item> decreasedValue) : super(items: decreasedValue);
}


