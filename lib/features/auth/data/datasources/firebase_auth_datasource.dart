import 'package:edu_quiz_app/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthDatasource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signUpWithEmail(String email, String password, String name);
  Future<UserModel> loginWithEmail(String email, String password);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
  Future<bool> isSignedIn();
}

class FirebaseAuthDatasourceImpl implements FirebaseAuthDatasource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseAuthDatasourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel> signInWithGoogle() async {
    final account = await googleSignIn.signIn();
    final auth = await account?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: auth?.idToken,
      accessToken: auth?.accessToken,
    );

    final result = await firebaseAuth.signInWithCredential(credential);
    final user = result.user!;

    return UserModel(uid: user.uid, email: user.email!, name: user.displayName ?? '');
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final user = result.user!;
    return UserModel(uid: user.uid, email: user.email!, name: user.displayName ?? '');
  }

  @override
  Future<UserModel> signUpWithEmail(String email, String password, String name) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await result.user?.updateDisplayName(name);
    final user = result.user!;
    return UserModel(uid: user.uid, email: user.email!, name: name);
  }

  @override
  Future<void> logout() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    final user = firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel(uid: user.uid, email: user.email!, name: user.displayName ?? '');
  }
}
