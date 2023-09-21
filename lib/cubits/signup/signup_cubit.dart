import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../repositories/auth/auth_repository.dart';

part 'signup_state.dart';

/// A [Cubit] is similar to [Bloc] but has no notion of events
/// and relies on methods to [emit] new states.
class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signUpWithCredentials() async {
    if (state.status == SignupStatus.submitting) return;

    if (!state.isFormValid) {
      emit(state.copyWith(
          status: SignupStatus.error, errorMessage: "please enter info"));
    }

    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      var user = await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
      print("user created");
      emit(state.copyWith(status: SignupStatus.success, user: user));
    } on Exception catch (e) {
      print("error in signup cubit ${e}");
      emit(state.copyWith(
          status: SignupStatus.error, errorMessage: e.toString()));
    } catch (e) {
      print("komt hierin ${e.toString()}");
      emit(state.copyWith(
          status: SignupStatus.error, errorMessage: e.toString()));
    }
  }
}
