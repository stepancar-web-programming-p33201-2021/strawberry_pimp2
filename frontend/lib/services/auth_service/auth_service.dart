import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/services/auth_service/auth_state.dart';

class AuthService extends StateNotifier<AuthState> {
  AuthService() : super(const AuthState.no());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signInWithGoogle() async {
    state = const AuthState.initializing();
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
      state = const AuthState.ready();
    } on Error catch (e) {
      state = AuthState.error(e.toString());
      rethrow;
    }
  }

  Future<void> signInWithAnonymously() async {
    state = const AuthState.initializing();
    try {
      await FirebaseAuth.instance.signInAnonymously();
      state = const AuthState.ready();
    } on Error catch (e) {
      state = AuthState.error(e.toString());
      rethrow;
    }
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
