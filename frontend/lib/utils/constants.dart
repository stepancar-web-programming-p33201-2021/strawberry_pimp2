import 'package:flutter/material.dart';
import 'package:tinder/generated/l10n.dart';

const supabasePublicKey =
    '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNjQyMjczNjMwLCJleHAiOjE5NTc4NDk2MzB9.2w6DCx5iA8udq_aGZbBSZNISXEaEfBUy3YcTxZs5kFI''';
const supabasePublicUrl = '''https://ivxeiirknoyyksstixwg.supabase.co''';
const serverLink = '''http://localhost:999''';
const authTokenKeyword = 'authtoken';

const keywordAnonymous = 'anonymous';

extension ContextHelper on BuildContext {
  S get s => S.of(this);
}

extension MapHelper<K, V> on Map<K, V> {
  Map<K, V> get noNullable {
    return Map.of(this)..removeWhere((key, value) => value == null);
  }
}