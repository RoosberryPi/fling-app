part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final String? errorMessage;
  final auth.User? user;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    this.errorMessage,
    this.user,
  });

  factory SignupState.initial() {
    return SignupState(
      email: '',
      password: '',
      status: SignupStatus.initial,
      user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, status, user];

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
    auth.User? user,
    String? errorMessage,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

// class SignupErrorState {
//   final String error;

//   const SignupErrorState({
//     required this.error
//   })
// }
