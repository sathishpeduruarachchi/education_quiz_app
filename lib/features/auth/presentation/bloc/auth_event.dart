import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginWithGooglePressed extends AuthEvent {}

class LoginWithEmailPressed extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmailPressed(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpWithEmailPressed extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignUpWithEmailPressed(this.email, this.password, this.name);

  @override
  List<Object?> get props => [email, password, name];
}

class LogoutPressed extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
