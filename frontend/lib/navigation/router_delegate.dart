import 'package:beamer/beamer.dart';
import 'package:tinder/navigation/routes.dart';
import 'package:tinder/pages/auth_page.dart';
import 'package:tinder/pages/chats_page.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      // Return either Widgets or BeamPages if more customization is needed
      Routes.home: (context, state, data) => const ChatsPage(),
      Routes.auth: (context, state, data) => const AuthPage(),
      // Routes.chats: (context, state, data) => const ChatsPage(),
      // '/chats/:chatId': (context, state, data) {
      //   // Take the path parameter of interest from BeamState
      //   final bookId = state.pathParameters['bookId']!;
      //   // Collect arbitrary data that persists throughout navigation
      //   final info = (data as MyObject).info;
      //   // Use BeamPage to define custom behavior
      //   return BeamPage(
      //     key: ValueKey('book-$bookId'),
      //     title: 'A Book #$bookId',
      //     popToNamed: '/',
      //     type: BeamPageType.scaleTransition,
      //     child: ChatPage(bookId, info),
      //   );
      // }
    },
  ),
);
