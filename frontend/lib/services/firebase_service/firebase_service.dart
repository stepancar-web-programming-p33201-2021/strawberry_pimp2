import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/firebase_options.dart';

final firebaseProvider = FutureProvider<FirebaseApp>((ref) async {
  final firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(firebase);
  return firebase;
});
