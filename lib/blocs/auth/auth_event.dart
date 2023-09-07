part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// every time a new user registers, we send an event to change the status
class AuthUserChanged extends AuthEvent {
  final auth.User? user;

  const AuthUserChanged({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
