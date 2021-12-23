import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final ChatMessage chatMessage;
Chat({required this.chatMessage});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();


  final ChatUser otherUser = ChatUser(
    name: "mehdi",
    uid: "25649654",
  );
  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: "heey how are you !!.",
      user: ChatUser(
          name: "mehdi",
          uid: "25649654",
      ),
      createdAt: DateTime.now(),
      quickReplies: QuickReplies(
        values: <Reply>[
          Reply(
            title: "😋 Yes",
            value: "Yes",
          ),
          Reply(
            title: "😞 Nope. What?",
            value: "no",
          ),
        ],
      ),
    ),
  ];
  var m = <ChatMessage>[];

  var i = 0;
  void onSend(ChatMessage message) {
    print(message.toJson());
    setState(() {
      messages.add(ChatMessage(text: message.text, user: otherUser));

    });
  }
@override
  void initState() {
    // TODO: implement initState
  messages.add(widget.chatMessage);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashChat(
      key: _chatViewKey,
      inverted: false,
      onSend: onSend,
      sendOnEnter: true,
      textInputAction: TextInputAction.send,
      user:otherUser,
      inputDecoration:
          InputDecoration.collapsed(hintText: "Add message here..."),
      dateFormat: DateFormat('yyyy-MMM-dd'),
      timeFormat: DateFormat('HH:mm'),
      messages: messages,
      showUserAvatar: false,
      showAvatarForEveryMessage: false,
      scrollToBottom: false,
      onPressAvatar: (ChatUser user) {
        print("OnPressAvatar: ${user.name}");
      },
      onLongPressAvatar: (ChatUser user) {
        print("OnLongPressAvatar: ${user.name}");
      },
      inputMaxLines: 5,
      messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
      alwaysShowSend: true,
      inputTextStyle: TextStyle(fontSize: 16.0),
      inputContainerStyle: BoxDecoration(
        border: Border.all(width: 0.0),
        color: Colors.white,
      ),
      onQuickReply: (Reply reply) {
        setState(() {
          messages.add(ChatMessage(
              text: reply.value, createdAt: DateTime.now(), user: otherUser));

          messages = [...messages];
        });

        Timer(const Duration(milliseconds: 300), () {
          _chatViewKey.currentState!.scrollController
            ..animateTo(
              _chatViewKey
                  .currentState!.scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
        });
      },
      onLoadEarlier: () {
        print("laoding...");
      },
      shouldShowLoadEarlier: false,
      showTraillingBeforeSend: true,
    ));
  }
}
