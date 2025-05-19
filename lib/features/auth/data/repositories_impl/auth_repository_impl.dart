
import 'package:edu_quiz_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:edu_quiz_app/features/auth/domain/entities/user.dart';
import 'package:edu_quiz_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<UserEntity> signInWithGoogle() => remote.signInWithGoogle();

  @override
  Future<UserEntity> signUpWithEmail(String email, String password, String name) =>
      remote.signUpWithEmail(email, password, name);

  @override
  Future<UserEntity> loginWithEmail(String email, String password) =>
      remote.loginWithEmail(email, password);

  @override
  Future<void> logout() => remote.logout();

  @override
  Future<bool> isSignedIn() => remote.isSignedIn();

  @override
  Future<UserEntity?> getCurrentUser() => remote.getCurrentUser();
}
