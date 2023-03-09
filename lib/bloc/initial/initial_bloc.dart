import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/initial/initial_event.dart';
import '../../repositories/repository.dart';
import 'initial_state.dart';


class InitialBloc extends Bloc<InitialEvent, InitialAppState> {
  InitialBloc() : super(InitialState()) {
    final ApiRepository apiRepository = ApiRepository();
    on<InitialEvent>((event, emit) async {
      emit(InitialState());
      final logo = await apiRepository.geLogo(4869856);
      emit(LoadedState(  logo!  ));
    });


  }
}
