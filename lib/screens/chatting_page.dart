import "package:healthcare_app/main.dart";
import 'package:healthcare_app/utils/config.dart';
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../providers/dio_provider.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Doctor'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1 /* số lượng tin nhắn */,
              itemBuilder: (context, index) {
                // TODO: Hiển thị tin nhắn của bác sĩ và người dùng tại đây
                return const ListTile(
                    title: Text(
                        'Nội dung tin nhắn') /* Widget hiển thị nội dung tin nhắn */
                    );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // TODO: Xử lý khi người dùng gửi tin nhắn
                    // onChanged: (value) {
                    //   // Xử lý nội dung tin nhắn
                    // },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // TODO: Xử lý khi người dùng nhấn gửi tin nhắn
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
