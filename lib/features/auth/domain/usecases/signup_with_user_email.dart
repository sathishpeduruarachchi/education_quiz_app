import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignupWithUserEmail {
  final AuthRepository repository;

  SignupWithUserEmail(this.repository);

  Future<UserEntity> call(String email, String password, String name) {
    return repository.signUpWithEmail(email, password, name);
  }
}
