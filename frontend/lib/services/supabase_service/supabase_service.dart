import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tinder/utils/constants.dart';

final supabaseProvider = FutureProvider<Supabase>((ref) async {
  final supabase = await Supabase.initialize(
      url: supabasePublicUrl, anonKey: supabasePublicKey);
  print(supabase);
  return supabase;
});
