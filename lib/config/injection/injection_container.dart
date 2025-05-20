import 'package:edu_quiz_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:edu_quiz_app/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:edu_quiz_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:edu_quiz_app/features/auth/domain/usecases/login_with_google.dart';
import 'package:edu_quiz_app/features/auth/domain/usecases/signup_with_user_email.dart';
import 'package:edu_quiz_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn());

  // Data sources
  sl.registerLazySingleton<FirebaseAuthDatasource>(
    () => FirebaseAuthDatasourceImpl(
      firebaseAuth: sl(),
      googleSignIn: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginWithGoogle(sl()));
  sl.registerLazySingleton(() => SignupWithUserEmail(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(
        loginWithGoogle: sl(),
        signupWithUserEmail: sl(),
        authRepository: sl(),
      ));
}
