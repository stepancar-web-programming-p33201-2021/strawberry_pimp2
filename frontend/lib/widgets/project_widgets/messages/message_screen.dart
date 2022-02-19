import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/services_models/input_state.dart';
import 'package:tinder/models/tmp_models/attachment_model.dart';
import 'package:tinder/models/tmp_models/message_model.dart';
import 'package:tinder/widgets/project_widgets/messages/messages_provider.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:html' as html;

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loader = CircularProgressIndicator.adaptive();
    final controller = useScrollController();
    return ref.watch(messagesProvider).when(
        data: (data) {
          return Stack(
            children: [
              DropzoneView(
                onDrop: (dynamic ev) {
                  print('Drop: $ev');
                },
                onDropMultiple: (List<dynamic>? ev) {
                  print('Drop multiple: $ev');
                },
              ),
              Positioned.fill(
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    if (data.isEmpty)
                      const SliverFillRemaining(
                        child: Center(
                            child: Text('Looks like there is no messages')),
                      ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final message = data[index];
                        final messageIn =
                            message.messageSender == MessageSender.a;
                        final date = '';

                        final attachments = <Widget>[];
                        if (message.attachments != null) {
                          for (final attach in message.attachments!) {
                            if (attach.type == AttachmentType.image) {
                              final image = Image.asset(attach.content!);
                              attachments.add(image);
                            }
                            if (attach.type == AttachmentType.document) {
                              final splitterParts = attach.content!.split(';');
                              final tile = ListTile(
                                title: Text(splitterParts[0]),
                                onTap: () async {
                                  ref
                                      .read(inputProvider.notifier)
                                      .downloadFile(splitterParts);
                                },
                              );
                              // final image = Image.asset(attach.content!);
                              attachments.add(tile);
                            }
                          }
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: messageIn
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: messageIn
                                                ? Colors.blueGrey
                                                : Colors.brown.shade50,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              crossAxisAlignment: messageIn
                                                  ? CrossAxisAlignment.start
                                                  : CrossAxisAlignment.end,
                                              children: [
                                                if (attachments.isNotEmpty)
                                                  ...attachments,
                                                if (message.createdAt != null)
                                                  SelectableText(
                                                      message.createdAt!),
                                                if (message.updatedAt != null)
                                                  SelectableText(
                                                      'Обновлено: ${message.updatedAt}'),
                                                if (message.readAt != null)
                                                  SelectableText(
                                                      'Прочитано: ${message.readAt}'),
                                              ]),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            if (date != null)
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectableText(date,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ])
                          ],
                        );
                      },
                      childCount: data.length,
                    )),
                    ACustomSliverHeader(ref)
                  ],
                ),
              ),
            ],
          );
        },
        error: (e, s) => Center(child: Text(e.toString())),
        loading: () => const Center(child: _loader));
    // selectedChatIdProvider;
    // return
  }
}

final inputProvider = StateNotifierProvider<InputNotifier, InputState>((ref) {
  return InputNotifier(ref);
});

class InputNotifier extends StateNotifier<InputState> {
  InputNotifier(this.ref) : super(const InputState());
  StateNotifierProviderRef ref;

  void downloadFile(List<String> parts) {
    openInANewTab(parts[1]);
    // FileSaver.instance.saveFile(parts[0], Uint8List bytes);
  }

  openInANewTab(url) {
    html.window.open(url, 'PlaceholderName');
  }

  void updateMessage(String message) {
    final textAttach = AttachmentModel.text(message);
    state = state.copyWith(textAttach: textAttach);
  }
}

class ACustomSliverHeader extends StatelessWidget {
  final WidgetRef ref;

  const ACustomSliverHeader(
    this.ref, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(ref),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  const Delegate(this.ref);

  final WidgetRef ref;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.lightGreen.shade200,
      child: TextField(onChanged: (data) {
        ref.read(inputProvider.notifier).updateMessage(data);
      }),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
