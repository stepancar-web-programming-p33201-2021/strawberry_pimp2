// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(id) => "Id: ${id}";

  static String m1(nick) => "Nick: ${nick}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Tinder"),
        "closed_account":
            MessageLookupByLibrary.simpleMessage("Closed account (Anonymous)"),
        "id_ui_string": m0,
        "nick_ui_string": m1,
        "open_account":
            MessageLookupByLibrary.simpleMessage("Open account (Mouse)"),
        "sign_in_anonymous_ui_string":
            MessageLookupByLibrary.simpleMessage("Sign In Anonymously"),
        "sign_in_google_ui_string":
            MessageLookupByLibrary.simpleMessage("Sign In with Google"),
        "there_is_no_chats_ui_string": MessageLookupByLibrary.simpleMessage(
            "Unfortunately you do not have any chats yet."),
        "welcome_ui_string": MessageLookupByLibrary.simpleMessage(
            "Hello Stranger, looks like you need to sign in into your account...\n Pls, follow button below."),
        "your_chats_ui_string":
            MessageLookupByLibrary.simpleMessage("Your Chats")
      };
}
