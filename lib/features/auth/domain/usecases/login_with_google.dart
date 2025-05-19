import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class LoginWithGoogle {
  final AuthRepository repository;

  LoginWithGoogle(this.repository);

  Future<UserEntity> call() async {
    return await repository.signInWithGoogle();
  }
}
