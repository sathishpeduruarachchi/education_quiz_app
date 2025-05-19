import 'package:edu_quiz_app/features/auth/domain/usecases/signup_with_user_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../auth/domain/usecases/login_with_google.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithGoogle loginWithGoogle;
  final SignupWithUserEmail signupWithUserEmail;
  final AuthRepository authRepository;

  AuthBloc({
    required this.loginWithGoogle,
    required this.signupWithUserEmail,
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<LoginWithGooglePressed>(_onGoogleLogin);
    on<LoginWithEmailPressed>(_onEmailLogin);
    on<SignUpWithEmailPressed>(_onEmailSignUp);
    on<LogoutPressed>(_onLogout);
    on<CheckAuthStatus>(_onCheckStatus);
  }

  Future<void> _onGoogleLogin(LoginWithGooglePressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginWithGoogle();
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError("Google login failed"));
    }
  }

  Future<void> _onEmailLogin(LoginWithEmailPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.loginWithEmail(event.email, event.password);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError("Email login failed"));
    }
  }

  Future<void> _onEmailSignUp(SignUpWithEmailPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signupWithUserEmail(event.email, event.password, event.name);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError("Signup failed"));
    }
  }

  Future<void> _onLogout(LogoutPressed event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(Unauthenticated());
  }

  Future<void> _onCheckStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    final isSignedIn = await authRepository.isSignedIn();
    if (isSignedIn) {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } else {
      emit(Unauthenticated());
    }
  }
}
