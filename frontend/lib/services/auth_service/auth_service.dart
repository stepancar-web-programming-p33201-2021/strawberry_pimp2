import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/services/auth_service/auth_state.dart';
import 'package:tinder/services/firebase_service/firebase_service.dart';

class AuthService extends StateNotifier<AuthState> {
  AuthService(StateNotifierProviderRef ref) : super(const AuthState.no()) {
    ///Init right after firebase would be init
    ref.read(firebaseProvider.future).whenComplete(() {
      _firebaseAuth = FirebaseAuth.instance;
      if (isSignedIn()) {
        state = const AuthState.ready();
      }
    });
  }

  late FirebaseAuth _firebaseAuth;

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
