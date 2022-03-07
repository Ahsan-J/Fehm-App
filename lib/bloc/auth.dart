import 'package:fehm/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocState {
  User? user;
}

abstract class AuthEvent {}

class SetAuthUser extends AuthEvent {
  User user;
  SetAuthUser(this.user);
}

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocState()) {
    on<SetAuthUser>((event, emit) {
      state.user = event.user;
      emit(state);
    });
  }
}
