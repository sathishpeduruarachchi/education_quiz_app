import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signUpWithEmail(String email, String password, String name);
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<void> logout();
  Future<bool> isSignedIn();
  Future<UserEntity?> getCurrentUser();
}
