import 'package:chat_app/chat_details.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

import 'chat_message.dart';
import 'models/conversation_list.dart';
import 'models/chat_users.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "images/userImage1.jpeg",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
  ];
  // final ChatUser user = ChatUser(
  //   name: "Fayeed",
  //   uid: "123456789",
  //   avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  // );

  List<ChatMessage> messages=[
  ChatMessage(
  text: "heey",
  user: ChatUser(
  name: "Fayeed",
  uid: "123456789",
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
  ChatMessage(
  text: "heey i'm malek",
  user: ChatUser(
  name: "malek",
  uid: "5241789",
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
    ChatMessage(
      text: "heey i'm ayoub",
      user: ChatUser(
        name: "ayoub",
        uid: "789654",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add New",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('123456');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      // return ChatDetailPage(
                      //   chatUser: chatUsers[index],
                      // );
                          return Chat(chatMessage: messages[index],);
                    }));
                  },
                  child: ConversationList(
                    name: messages[index].user.name!,
                    messageText: messages[index].text.toString(),
                    time: messages[index].createdAt.day.toString()+'/'+messages[index].createdAt.month.toString()+'/'+messages[index].createdAt.year.toString(),
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
