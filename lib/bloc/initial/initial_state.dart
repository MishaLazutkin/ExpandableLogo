import 'package:equatable/equatable.dart';
import '../../models/models/logo.dart';

class InitialAppState extends Equatable {
  late  Logo? logo;
    InitialAppState( {this.logo} );


  @override
  List<Object?> get props => [logo];

}

class InitialState extends InitialAppState{

}

class LoadedState extends InitialAppState {
  late  Logo? logo;
  LoadedState(this.logo );
}

