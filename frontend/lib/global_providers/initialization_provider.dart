import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/services/firebase_service/firebase_service.dart';
import 'package:tinder/services/supabase_service/supabase_service.dart';

final initializationProvider = Provider<void>((ref) {
  ref.read(firebaseProvider);
  ref.read(supabaseProvider);
  return;
});
