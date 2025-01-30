part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
final class AuthSignUp extends AuthEvent{
  final String email, password, name;
  AuthSignUp( {required this.name,required this.email, required this.password});
}