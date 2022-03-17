part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User user;

  AuthLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}
