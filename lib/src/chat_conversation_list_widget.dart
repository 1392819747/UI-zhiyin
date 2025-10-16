import 'package:flutter/material.dart';
import 'package:tuicall_kit_example/src/chat_config.dart';
import 'package:tuicall_kit_example/src/chat_main_widget.dart';

/// 简化的聊天会话列表组件
class ChatConversationListWidget extends StatelessWidget {
  const ChatConversationListWidget({Key? key}) : super(key: key);

  void _createNewChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String userId = '';
        return AlertDialog(
          title: Text('创建新聊天'),
          content: TextField(
            decoration: InputDecoration(
              labelText: '用户ID',
              hintText: '请输入要聊天的用户ID',
            ),
            onChanged: (value) {
              userId = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                if (userId.isNotEmpty) {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatMainWidget(
                        userId: userId,
                        userSig: 'demo_user_sig_$userId',
                      ),
                    ),
                  );
                }
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天会话'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _createNewChat(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            Text(
              '聊天功能开发中...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 模拟进入聊天界面
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatMainWidget(
                      userId: ChatConfig.defaultUserId,
                      userSig: 'demo_user_sig',
                    ),
                  ),
                );
              },
              child: Text('进入聊天界面'),
            ),
          ],
        ),
      ),
    );
  }
}