import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/services_models/input_state.dart';
import 'package:tinder/models/tmp_models/attachment_model.dart';
import 'package:tinder/models/tmp_models/message_model.dart';
import 'package:tinder/widgets/project_widgets/messages/messages_provider.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:html' as html;

import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';

final hoverProvider = StateProvider<bool>((ref) {
  return false;
});

final filepickercontrollerProvider =
    StateProvider<DropzoneViewController?>((ref) {
  return null;
});

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loader = CircularProgressIndicator.adaptive();
    final controller = useScrollController();
    final id = ref.watch(selectedChatIdProvider);

    return ref.watch(messagesProvider).when(
        data: (data) {
          return Stack(
            children: [
              DropzoneView(
                onCreated: (DropzoneViewController ctrl) => ref
                    .read(filepickercontrollerProvider.notifier)
                    .state = ctrl,
                onHover: () {
                  ref.read(hoverProvider.notifier).state = true;
                },
                onLeave: () {
                  ref.read(hoverProvider.notifier).state = false;
                },
                onDrop: (dynamic ev) {
                  ref.read(hoverProvider.notifier).state = false;
                  // ref.read(inputProvider.notifier).addAttach(ev);
                  print('Drop: $ev');
                },
                onDropMultiple: (List<dynamic>? ev) {
                  ref.read(hoverProvider.notifier).state = false;
                  ref.read(inputProvider.notifier).addAttachments(ev);
                  print('Drop multiple: $ev');
                },
              ),
              Positioned.fill(
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    ACustomSliverHeader(ref),
                    Consumer(builder: (_, ref, child) {
                      final input = ref.watch(inputProvider);
                      final attachments = <Widget>[];
                      for (final attach in input.other) {
                        if (attach.type == AttachmentType.image) {
                          final image = Image.memory(attach.uint8list!);
                          attachments.add(Stack(
                            children: [
                              image,
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(inputProvider.notifier)
                                        .removeAttach(attach);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ));
                        }
                        if (attach.type == AttachmentType.document) {
                          final splitterParts = attach.content!.split(';');
                          final tile = ListTile(
                            title: Text(splitterParts[0]),
                            leading: IconButton(
                              onPressed: () {
                                ref
                                    .read(inputProvider.notifier)
                                    .removeAttach(attach);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          );
                          // final image = Image.asset(attach.content!);
                          attachments.add(tile);
                        }
                      }
                      return SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (input.textAttach?.content != null)
                              Text('Message: ${input.textAttach!.content!}'),
                            if ((input.other).isNotEmpty) ...attachments
                          ],
                        ),
                      );
                    }),
                    if (data.isEmpty)
                      SliverFillRemaining(
                        child: Center(
                            child: Text(
                                'Looks like there is no messages in chat with id :: $id')),
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
                            final splitterParts = attach.content!.split(';');
                            if (attach.type == AttachmentType.image) {
                              final image = Image.network(splitterParts[0]);
                              attachments.add(image);
                            }
                            if (attach.type == AttachmentType.document) {
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
                            if (attach.type == AttachmentType.text) {
                              final tile = ListTile(
                                title: SelectableText(attach.content!),
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
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final hover = ref.watch(hoverProvider);
                  Widget body;
                  if (!hover) {
                    body = const SizedBox.square(dimension: 0);
                  } else {
                    body = Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Center(
                        child: Text('Drop your weapons'),
                      ),
                    );
                  }
                  return AnimatedSwitcher(
                      duration: kThemeAnimationDuration, child: body);
                },
              )
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

  void clear() {
    state = const InputState();
  }

  void downloadFile(List<String> parts) {
    openInANewTab(parts[0]);
    // FileSaver.instance.saveFile(parts[0], Uint8List bytes);
  }

  void removeAttach(AttachmentModel model) {
    final oldList = state.other.toList();
    oldList.remove(model);
    state = state.copyWith(other: oldList);
  }

  Future<void> addAttach(dynamic file) async {
    final controller = ref.read(filepickercontrollerProvider);
    final name = await controller?.getFilename(file);
    final data = await controller?.getFileData(file);
    final mime = await controller?.getFileMIME(file);
    AttachmentModel? model;
    if (name != null && data != null && mime != null) {
      final isImage = mime.contains('image');
      if (isImage) {
        model = AttachmentModel.imageUint(name, data);
      } else {
        model = AttachmentModel.document(name, data);
      }
    }
    if (model != null) {
      final oldList = state.other.toList();
      oldList.add(model);
      state = state.copyWith(other: oldList);
    }

    print(file);
  }

  void addAttachments(List<dynamic>? files) {
    if (files != null) {
      for (var file in files) {
        addAttach(file);
      }
    }
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
      child: Row(
        children: [
          Flexible(
            child: TextField(onChanged: (data) {
              ref.read(inputProvider.notifier).updateMessage(data);
            }),
          ),
          Consumer(builder: (context, ref, child) {
            final input = ref.watch(userProfileControllerProvider.notifier);
            return IconButton(
              onPressed: input.sendMessage,
              icon: const Icon(Icons.send),
            );
          })
        ],
      ),
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
