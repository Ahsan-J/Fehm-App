import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fehm/model/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SetAuthUser>((event, emit) {
      emit(AuthLoggedIn(user: event.user));
    });
    on<RemoveAuthUser>((event, emit) {
      emit(AuthInitial());
    });
  }
}
