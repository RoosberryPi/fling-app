import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      return user;
    } catch (error) {
      print("signup error is ${error}");
      throw error;
    }
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth
      .userChanges(); // stream that informs us in case something chaned in the user object

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
