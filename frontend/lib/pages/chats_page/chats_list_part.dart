part of 'chats_page.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Container(
              color: Colors.blue[100 * (index % 9 + 1)],
              height: 80,
              alignment: Alignment.center,
              child: Text(
                "Item $index",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          );
        },
        childCount: 1000, // 1000 list items
      ),
    );
  }
}
