import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tinder/utils/constants.dart';

final supabaseProvider = FutureProvider<SupabaseClient>((ref) async {
  final client = SupabaseClient(supabasePublicUrl, supabasePublicKey);

  return client;
});


