import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/widgets/item.dart';
import '../../models/models/logo.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {

    on<CounterIncrementEvent>((event, emit) {
      emit(IncrementState(List.from(state.items)..add(event.item)));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(DecrementState(List.from(state.items)..removeLast()));
    });

  }
}
